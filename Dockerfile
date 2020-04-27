from jupyter/scipy-notebook
COPY ./requirements.txt ./
RUN python -m pip install -r ./requirements.txt

# install Oracle and Postgres client dependencies
USER root
RUN apt-get update && apt-get install -y libaio1 wget unzip python3-dev postgresql postgresql-contrib python3-psycopg2 libpq-dev

WORKDIR /opt/oracle
RUN wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip && \
    unzip instantclient-basiclite-linuxx64.zip && rm -f instantclient-basiclite-linuxx64.zip && \
    cd /opt/oracle/instantclient* && rm -f *jdbc* *occi* *mysql* *README *jar uidrvci genezi adrci && \
    echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf && ldconfig

COPY ./requirements.txt ./
RUN python -m pip install -r ./requirements.txt

WORKDIR /home/jovyan/work


