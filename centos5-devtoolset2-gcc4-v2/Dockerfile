FROM dockbuild/centos5-devtoolset2-gcc4

WORKDIR /source

RUN rm -f /etc/yum.repos.d/* 
COPY files/CentOS-Vault.repo /etc/yum.repos.d/CentOS-Vault.repo
COPY files/devtoolset2.repo /etc/yum.repos.d/devtoolset2.repo

RUN yum clean all && yum makecache
RUN yum install glibc-devel.i386 libgcc.i386 libstdc++.i386 devtoolset-2 -y

COPY files/devtoolset-2-libstdc++-devel-4.8.2-15.el5.i386.rpm .
RUN rpm -ivh devtoolset-2-libstdc++-devel-4.8.2-15.el5.i386.rpm

COPY files/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]