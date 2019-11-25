from jupyter/scipy-notebook
COPY ./requirements.txt ./
RUN python -m pip install -r ./requirements.txt


