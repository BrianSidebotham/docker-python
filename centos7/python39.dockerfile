FROM centos:centos7

WORKDIR /container

RUN yum update -y \
    && yum install -y wget \
    && wget -q -O python39-3.9.2-1.el7.x86_64.rpm https://github.com/BrianSidebotham/docker-python-builder/releases/download/v0.1/python39-3.9.2-1.el7.x86_64.rpm \
    && yum install -y python39-3.9.2-1.el7.x86_64.rpm \
    && rm -f python39-3.9.2-1.el7.x86_64.rpm \
    && yum clean all \
    && /opt/python39/bin/python3 -V

ENTRYPOINT [ "/opt/python39/bin/python3" ]
