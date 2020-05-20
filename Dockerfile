FROM ubuntu:18.04
LABEL maintainer="Niklas Hauser <niklas.hauser@rwth-aachen.de>"
LABEL Description="Image for building and debugging arm-embedded projects from git"
WORKDIR /work

ADD . /work

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    python3 \
    python3-pip \
    python \
    python3-dev \
    python-dev \
    protobuf-compiler \
    perl \
    clang-tools \
    clang \
# Development files
      build-essential \
      git \
      bzip2 \
      wget && \
    apt-get clean
RUN pip3 install protobuf
RUN pip3 install protobuf-compiler
RUN wget https://cmake.org/files/v3.4/cmake-3.4.1-Linux-x86_64.tar.gz
RUN tar xf cmake-3.4.1-Linux-x86_64.tar.gz
RUN  export PATH="`pwd`/cmake-3.4.1-Linux-x86_64/bin:$PATH"
RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 | tar -xj

ENV PATH "/work/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH"
