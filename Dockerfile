FROM nvidia/cuda:8.0-runtime-ubuntu16.04
RUN apt-get update && apt-get install -y git nvidia-opencl-icd-367 build-essential
WORKDIR /home
RUN git clone https://github.com/hashcat/hashcat.git
RUN cd hashcat && \
git submodule update --init
RUN cd hashcat && make linux64
