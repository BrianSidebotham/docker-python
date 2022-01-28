FROM centos:centos7

ENV PATH="/opt/python310/bin:${PATH}"

WORKDIR /container

RUN yum install -y wget \
    && wget -q -O python310-3.10.1-1.el7.x86_64.rpm https://github.com/BrianSidebotham/docker-python-builder/releases/download/2021-01/python310-3.10.1-1.el7.x86_64.rpm \
    && yum install -y python310-3.10.1-1.el7.x86_64.rpm \
    && rm -f python310-3.10.1-1.el7.x86_64.rpm \
    && yum clean all \
    && /opt/python310/bin/python3 -V \
    && /opt/python310/bin/pip3 install --upgrade pip wheel setuptools

COPY ./centos7/entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "python3" ]
