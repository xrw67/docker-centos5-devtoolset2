FROM centos:6

ENV CC=/opt/rh/devtoolset-9/root/usr/bin/gcc \
    CXX=/opt/rh/devtoolset-9/root/usr/bin/g++ \
    FC=/opt/rh/devtoolset-9/root/usr/bin/gfortran \
    PATH=/opt/rh/devtoolset-9/root/usr/bin${PATH:+:${PATH}} \
    # http://bugs.python.org/issue19846
    # > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
    # https://sourceware.org/bugzilla/show_bug.cgi?id=17318#c4
    # > set en_US.UTF-8 instead of C.UTF-8 because the former is not supported on all systems.
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ARG CMAKE_VERSION=3.27.9
ARG GIT_VERSION=2.35.0
ARG NINJA_VERSION=1.10.0.gfb670.kitware.jobserver-1
ARG PYTHON_VERSION=3.12.1
ARG LCOV_VERSION=1.16

# Image build scripts
COPY \
    imagefiles/build-and-install-git.sh \
    imagefiles/build-and-install-python.sh \
    imagefiles/install-cmake-binary.sh \
    imagefiles/install-gosu-binary.sh \
    imagefiles/install-gosu-binary-wrapper.sh \
    imagefiles/install-lcov-binary.sh \
    imagefiles/install-ninja-binary.sh \
    /imagefiles/

COPY imagefiles/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
COPY imagefiles/devtoolset9.repo /etc/yum.repos.d/devtoolset9.repo

RUN yum clean all && \
    yum makecache && \
    yum update -y && \
    yum install -y \
        automake \
        bison \
        curl \
        curl-devel \
        coreutils \
        file \
        gettext \
        make \
        openssh-clients \
        openssl-devel \
        patch \
        perl \
        perl-devel \
        unzip \
        wget \
        tar \
        which \
        yasm \
        zlib-devel \
        vim && \
    # Needed to build Python from source
    yum install -y \
        bzip2-devel \
        libffi-devel \
        readline-devel \
        sqlite-devel \
        xz-devel && \
    #
    # Install devtoolset
    #
    yum install -y glibc-devel.i686 libgcc.i686 libstdc++.i686 devtoolset-9 \
        https://download.cloudlinux.com/cloudlinux/6/sclo/devtoolset-9/i386/devtoolset-9-libstdc++-devel-9.1.1-2.5.el6.i686.rpm \
    && \
    #
    # Custom install
    #
    /imagefiles/install-cmake-binary.sh && \
    /imagefiles/install-gosu-binary.sh && \
    /imagefiles/install-gosu-binary-wrapper.sh && \
    /imagefiles/install-lcov-binary.sh && \
    /imagefiles/install-ninja-binary.sh && \
    /imagefiles/build-and-install-git.sh && \
    /imagefiles/build-and-install-python.sh && \
    # Remove sudo provided by "devtoolset-7" since it doesn't work with
    # our sudo wrapper calling gosu.
    rm -f /opt/rh/devtoolset-9/root/usr/bin/sudo && \
    rm -rf /imagefiles && \
    #
    # cleanup
    #
    yum -y clean all && rm -rf /var/cache/yum

WORKDIR /work

ENTRYPOINT ["/entrypoint.sh"]

# Runtime scripts
COPY imagefiles/entrypoint.sh /