FROM continuumio/miniconda3

RUN conda update python

# all openssl versions are vulnerable, so we exclude it for now
#RUN conda update openssl

ENTRYPOINT conda list
