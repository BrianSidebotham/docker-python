FROM ubuntu:20.04

ENV INSTALLPATH="/opt/python38"
ENV PATH="${INSTALLPATH}/bin:${PATH}"
ENV PYTHONRELEASE="2022-02"
ENV PYTHONPACKAGE="python38-ubuntu-focal_3.8.12-2_amd64.deb"

WORKDIR /container

RUN apt-get update \
    && apt-get install -y wget \
    && echo "Downloading ${PYTHONPACKAGE}" \
    && wget -q -O ${PYTHONPACKAGE} https://github.com/BrianSidebotham/docker-python-builder/releases/download/${PYTHONRELEASE}/${PYTHONPACKAGE} \
    && apt install -y ./${PYTHONPACKAGE} \
    && rm -f ${PYTHONPACKAGE} \
    && apt-get clean \
    && apt-get autoremove --yes \
    && ${INSTALLPATH}/bin/python3 -V \
    && ${INSTALLPATH}/bin/pip3 install --upgrade pip wheel setuptools

COPY ./entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "python3" ]
