FROM debian:12

LABEL maintainer="xwr67 <xrw67@outlook.com>"

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        automake \
        bc \
        binutils-dev \
        binutils-multiarch \
        bison \
        clang-format \
        cmake \
        crash \
        curl \
        coreutils \
        file \
        flex \
        gettext \
        make \
        gcc \
        gcc-multilib \
        g++-multilib \
        gdb \
        git \
        lcov \
        libelf-dev \
        libdw-dev \
        libncurses-dev \
        linux-perf \
        ninja-build \
        tar \
        python3-pip \
        subversion \
        unzip \
        vim \
        wget

WORKDIR /work
