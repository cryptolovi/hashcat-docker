FROM debian:latest

RUN apt-get update && apt-get install -y git
WORKDIR /home
RUN git clone https://github.com/hashcat/hashcat.git
#RUN git clone https://github.com/hashcat/hashcat-utils.git
#RUN git clone https://github.com/hashcat/princeprocessor.git
RUN cd hashcat && \
mkdir -p deps/OpenCL-Headers && \
git clone https://github.com/KhronosGroup/OpenCL-Headers deps/OpenCL-Headers/CL
RUN apt-get install -y build-essential
RUN cd hashcat && make linux64
