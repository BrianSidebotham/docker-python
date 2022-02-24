FROM quay.io/centos/centos:7

ENV INSTALLPATH="/opt/python38"
ENV PATH="${INSTALLPATH}/bin:${PATH}"
ENV PYTHONRELEASE="2022-02"
ENV PYTHONPACKAGE="python38-3.8.12-1.el7.x86_64.rpm"

WORKDIR /container

RUN yum install -y wget epel-release \
    && echo "Downloading ${PYTHONPACKAGE}" \
    && wget -q -O ${PYTHONPACKAGE} https://github.com/BrianSidebotham/docker-python-builder/releases/download/${PYTHONRELEASE}/${PYTHONPACKAGE} \
    && yum install -y ${PYTHONPACKAGE} \
    && rm -f ${PYTHONPACKAGE} \
    && yum clean all \
    && rm -rf /var/cache/yum/* \
    && ${INSTALLPATH}/bin/python3 -V \
    && ${INSTALLPATH}/bin/pip3 install --upgrade pip wheel setuptools

COPY ./entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "python3" ]
