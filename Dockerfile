#FROM debian:latest
FROM nvidia/cuda:7.5-runtime
RUN apt-get update && apt-get install -y git ocl-icd-libopencl1 build-essential
WORKDIR /home
RUN git clone https://github.com/hashcat/hashcat.git
#RUN git clone https://github.com/hashcat/hashcat-utils.git
#RUN git clone https://github.com/hashcat/princeprocessor.git
RUN cd hashcat && \
mkdir -p deps/OpenCL-Headers && \
git clone https://github.com/KhronosGroup/OpenCL-Headers deps/OpenCL-Headers/CL
RUN cd hashcat && make linux64
