# centos6-devtoolset9-gcc9

GCC9(C++17) for CentOS 6 docker image.

## note

- add `-m32` support
- workdir：/work

## toolchan version

- gcc：gcc version 9.1.1 20190605 (Red Hat 9.1.1-2) (GCC)
- glibc: 2.12-1.212
- cmake：3.27.9
- ninja：1.10.0.git.kitware.jobserver-1
- python: 3.12.1
- lcov: 1.16
- zsh

## issue

- centos:6 `/bin/bash` not working on Linux kernel 4.15.9

> Running a docker run --rm -it centos:6 bash fails with exit status 139 (i.e. bash exits with SIGSEGV) on Linux kernel 4.15.9. Downgrading to 4.14.15 (which is vulnerable to Spectre V1) gets rid of the segfault.
> <https://stackoverflow.com/questions/49486873/how-to-run-interactive-centos-6-within-docker>
