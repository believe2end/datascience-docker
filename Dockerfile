FROM registry.cn-hangzhou.aliyuncs.com/ibbd/datascience-notebook
RUN mkdir -p /home/jovyan/.pip \
    && mkdir -p /home/jovyan/.jupyter
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/
COPY pip.conf /home/jovyan/.pip/
RUN pip install --upgrade pip \
    && pip install --upgrade plotly \
    && pip install autopep8 \
    && pip install cufflinks

RUN pip install jupyter_contrib_nbextensions \
    && jupyter contrib nbextension install --user \
    && jupyter nbextension enable codefolding/main
