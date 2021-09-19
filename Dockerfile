
FROM phusion/baseimage:0.11

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
  bash Miniconda3-latest-Linux-x86_64.sh -b && \
  rm -f Miniconda3-latest-Linux-x86_64.sh 

RUN conda config --add channels conda-forge && \
  conda config --set channel_priority strict && \
  conda install ipyrad -c conda-forge -c bioconda
