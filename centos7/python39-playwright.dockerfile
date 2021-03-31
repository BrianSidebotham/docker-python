FROM bsidebotham/python:39-centos7

RUN /opt/python39/bin/python3 -m pip install playwright \
    && /opt/python39/bin/python3 -m playwright install

ENTRYPOINT [ "/opt/python39/bin/python3" ]