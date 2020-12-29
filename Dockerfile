FROM debian:stable
LABEL maintainer="Rik van der Heijden <rik.vanderheijden@zoolt.com>"
LABEL Description="Debian-based image for building and debugging arm-embedded projects from git"
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

RUN wget -qO- "https://cmake.org/files/v3.17/cmake-3.17.0-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local
RUN wget -qO- "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2"| tar -xj

ENV PATH "/work/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH"
