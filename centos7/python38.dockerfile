FROM centos:centos7

ENV PATH="/opt/python38/bin:${PATH}"

WORKDIR /container

RUN yum install -y wget \
    && wget -q -O python38-3.8.10-1.el7.x86_64.rpm https://github.com/BrianSidebotham/docker-python-builder/releases/download/2021-01/python38-3.8.10-1.el7.x86_64.rpm \
    && yum install -y python38-3.8.10-1.el7.x86_64.rpm \
    && rm -f python38-3.8.10-1.el7.x86_64.rpm \
    && yum clean all \
    && /opt/python38/bin/python3 -V \
    && /opt/python38/bin/pip3 install --upgrade pip wheel setuptools

COPY ./centos7/entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "python3" ]
