FROM dmikhin/c7-devtoolset-12

WORKDIR /source

COPY files/llvmtoolset-build.repo /etc/yum.repos.d/llvmtoolset-build.repo

RUN yum install --nogpgcheck vim lcov llvm-toolset-11.0 llvm-toolset-11.0-clang-tools-extra -y


# Environment Configuration
ENV CC=/opt/rh/devtoolset-12/root/usr/bin/gcc \
    CPP=/opt/rh/devtoolset-12/root/usr/bin/cpp \
    CXX=/opt/rh/devtoolset-12/root/usr/bin/g++ \
    PATH=/opt/rh/llvm-toolset-11.0/root/usr/bin:/opt/rh/llvm-toolset-11.0/root/usr/sbin:/opt/rh/devtoolset-12/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LD_LIBRARY_PATH=/opt/rh/llvm-toolset-11.0/root/usr/lib64:/opt/rh/devtoolset-12/root/usr/lib64:/opt/rh/devtoolset-12/root/usr/lib:/opt/rh/devtoolset-12/root/usr/lib64/dyninst:/opt/rh/devtoolset-12/root/usr/lib/dyninst \
    MANPATH=/opt/rh/llvm-toolset-11.0/root/usr/share/man:/opt/rh/devtoolset-12/root/usr/share/man \
    PKG_CONFIG_PATH=/opt/rh/llvm-toolset-11.0/root/usr/lib64/pkgconfig:/opt/rh/devtoolset-12/root/usr/lib64/pkgconfig \
    INFOPATH=/opt/rh/devtoolset-12/root/usr/share/info \
    X_SCLS=devtoolset-12 \
    PCP_DIR=/opt/rh/devtoolset-12/root