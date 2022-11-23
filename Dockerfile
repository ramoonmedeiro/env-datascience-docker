FROM ubuntu:20.04


RUN echo "**** Installing main packages ****" && \
    apt-get update && apt-get install -y \
    	tzdata \
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

RUN echo "**** Instaling Miniconda ****" && \
	curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o Miniconda3-latest-Linux-x86_64.sh && \
	/bin/bash Miniconda3-latest-Linux-x86_64.sh && \
	export PATH=$PATH:/home/miniconda3/bin

EXPOSE 8888

RUN mkdir ds
ENV HOME =/ds
ENV SHELL=/bin/bash
WORKDIR /ds

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser"]