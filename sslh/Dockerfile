FROM debian:stable-slim

ENV HOST_LISTEN=0.0.0.0
ENV PORT_LISTEN=443
ENV SSH_HOST_FORWARD=127.0.0.1
ENV SSH_PORT_FORWARD=4222
ENV SSL_HOST_FORWARD=127.0.0.1
ENV SSL_PORT_FORWARD=42443

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get --yes --no-install-recommends install sslh \
    && apt-get clean

EXPOSE $PORT_LISTEN
CMD /usr/sbin/sslh \
    --foreground \
    --listen $HOST_LISTEN:$PORT_LISTEN \
    --ssh $SSH_HOST_FORWARD:$SSH_PORT_FORWARD \
    --ssl $SSL_HOST_FORWARD:$SSL_PORT_FORWARD
