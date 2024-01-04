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

## A note about vsyscall

CentOS 6 binaries and/or libraries are built to expect some system calls to be accessed via vsyscall mappings. Some linux distributions have opted to disable vsyscall entirely (opting exclusively for more secure vdso mappings), causing segmentation faults.

If running `docker run --rm -it centos:6` bash immediately exits with status code 139, check to see if your system has disabled vsyscall:

```
$ cat /proc/self/maps | egrep 'vdso|vsyscall'
7fffccfcc000-7fffccfce000 r-xp 00000000 00:00 0                          [vdso]
$
```

vs

```
$ cat /proc/self/maps | egrep 'vdso|vsyscall'
7fffe03fe000-7fffe0400000 r-xp 00000000 00:00 0                          [vdso]
ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]
```

If you do not see a vsyscall mapping, and you need to run a CentOS 6 container, try adding `vsyscall=emulated` to the kernel options in your bootloader

Further reading : [lwn.net](https://lwn.net/Articles/446528)
