# Python

Container images that provide various versions of Python with various dependencies pre-installed as quicker CI starting position.

The Python installed in these images comes from the [docker-python-builder](https://github.com/BrianSidebotham/docker-python-builder) project which builds a relocateable Python under `/opt/`.

If you want to package a Python application, including the Python binaries then this would be a great place to start.

## Versions

There are various version of Python available. V3.9 is the current latest version and can be run like so:

```console
$ docker run ghcr.io/briansidebotham/docker-python:3.9-centos7 python3 -V

Python 3.9.9
```

Arguments can be passed because Python is the `ENTRYPOINT` for the container. If you want to have an interactive session in the container instead, simply replace the `ENTRYPOINT` with `/bin/bash` like so:

```console
$ docker run -it ghcr.io/briansidebotham/docker-python:3.9-centos7 /bin/bash

[root@5b25005b7a97 container]# python3 -V
Python 3.9.9


```

Only major and minor versions can be specified. The patch version automatically changes when a new version is released as these are generally security patches.
