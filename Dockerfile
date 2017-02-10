FROM nvidia/cuda:8.0-runtime-ubuntu16.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \ 
git nvidia-opencl-icd-367 build-essential
WORKDIR /home
RUN git clone https://github.com/hashcat/hashcat.git
RUN cd hashcat && \
git submodule update --init
RUN cd hashcat && make linux64
