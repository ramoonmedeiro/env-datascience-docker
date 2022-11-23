FROM ubuntu:20.04


RUN echo "**** Installing main packages ****" && \
    apt-get update && apt-get install -y tzdata

ENV TZ=America/Sao_Paulo

RUN apt-get update && apt-get install -y \
    	wget \
    	build-essential \
    	byobu \
    	curl \
    	git-core \
    	htop \
    	pkg-config \
    	python3-dev \
    	python3-pip \
    	python3-setuptools \
    	python3-virtualenv \
    	unzip
 
RUN echo " *** Baixando pacotes para DataScience ****" && \
	echo "pandas" >> requirements.txt && \
	echo "numpy" >> requirements.txt && \
    echo "matplotlib" >> requirements.txt && \
    echo "seaborn" >> requirements.txt && \
    echo "scipy" >> requirements.txt && \
    echo "scikit-learn" >> requirements.txt && \
    echo "tensorflow" >> requirements.txt && \
    echo "jupyter" >> requirements.txt



RUN pip3 install -r requirements.txt

EXPOSE 8888

RUN mkdir ds
ENV HOME =/ds
ENV SHELL=/bin/bash
WORKDIR /ds