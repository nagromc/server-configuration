FROM alpine:latest

RUN apk update \
    && apk add borgbackup openssh openssl \
    && rm  -rf /tmp/* /var/cache/apk/*

ADD https://raw.githubusercontent.com/nagromc/dotfiles/master/ssh/authorized_keys /root/.ssh/authorized_keys
ADD sshd_config /etc/ssh
ADD entrypoint.sh /usr/local/bin

EXPOSE 22
ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
