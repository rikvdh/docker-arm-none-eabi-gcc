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
RUN wget -qO- "https://cmake.org/files/v3.17/cmake-3.17.0-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local
RUN wget -qO- "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2"| tar -xj

ENV PATH "/work/gcc-arm-none-eabi-9-2020-q2-update/bin:$PATH"
