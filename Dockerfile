FROM nvidia/cuda:8.0-runtime-ubuntu16.04
ENV http_proxy=
ENV https_proxy=
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -y ppa:graphics-drivers/ppa
RUN apt-get update && apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \ 
git nvidia-opencl-icd-381 build-essential
WORKDIR /home
RUN git clone https://github.com/hashcat/hashcat.git
RUN cd hashcat && \
git submodule update --init
RUN cd hashcat && make linux64
