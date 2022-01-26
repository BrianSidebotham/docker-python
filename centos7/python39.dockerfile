FROM centos:centos7

WORKDIR /container

RUN yum install -y wget \
    && wget -q -O python39-3.9.9-1.el7.x86_64.rpm https://github.com/BrianSidebotham/docker-python-builder/releases/download/2021-01/python39-3.9.9-1.el7.x86_64.rpm \
    && yum install -y python39-3.9.9-1.el7.x86_64.rpm \
    && rm -f python39-3.9.9-1.el7.x86_64.rpm \
    && echo 'export PATH=/opt/python39/bin:${PATH}' >> /etc/profile.d/sh.local \
    && yum clean all \
    && /opt/python39/bin/python3 -V \
    && /opt/python39/bin/pip3 install --upgrade pip wheel setuptools

COPY ./centos7/entrypoint.sh /

ENTRYPOINT [ "/bin/bash", "-c", "/entrypoint.sh" ]
CMD [ "python3" ]
