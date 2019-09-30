ARG  LOCALSTACK_VERSION=latest

FROM localstack/localstack:$LOCALSTACK_VERSION

COPY start.sh /usr/local/bin/start.sh
COPY service-ports.py /opt/code/localstack/service-ports.py

ENTRYPOINT ["start.sh"]

