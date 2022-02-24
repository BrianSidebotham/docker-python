# Python

Container images that provide various versions of Python with various dependencies pre-installed as quicker CI starting position.

The Python installed in these images comes from the [docker-python-builder](https://github.com/BrianSidebotham/docker-python-builder) project which builds a relocateable Python under `/opt/`.

If you want to package a Python application, including the Python binaries then this would be a great place to start.

If you're looking to just a container with a specific version of Python on, these containers are used to build another set of containers for just that purpose over at the [docker-python](https://github.com/BrianSidebotham/docker-python) project. Head over there for images you can base your application on.

## Versions

There are various version of Python available. V3.10 is the current latest version and can be run like so:

```console
$ docker run ghcr.io/briansidebotham/docker-python:3.10-centos7 python3 -V

Python 3.10.1
```

The entrypoint for this container is a simple script that runs any command passed into it after sourcing the bash profile. You can start an interactive bash session within the container like so:

```console
$ docker run -it ghcr.io/briansidebotham/docker-python:3.10-centos7 /bin/bash

[root@5b25005b7a97 container]# python3 -V
Python 3.10.1


```

Only major and minor versions can be specified. The patch version automatically changes when a new version is released as these are generally security patches.
