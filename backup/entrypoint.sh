#!/usr/bin/env sh

if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
fi
if [ ! -f "/etc/ssh/ssh_host_dsa_key" ]; then
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
fi
if [ ! -f "/etc/ssh/ssh_host_ecdsa_key" ]; then
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
fi
if [ ! -f "/etc/ssh/ssh_host_ed25519_key" ]; then
    ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
fi

if [ ! -d "/var/run/sshd" ]; then
    mkdir -p /var/run/sshd
fi

# This is needed to replace /etc/profile.d/envvar-sshd.sh before running
# `sshd -D` to make the given Docker env vars (`docker run -e ENV_VAR=value`)
# available in the ssh session
echo "export LOCAL_BACKUP_REPO=$DCK_LOCAL_BACKUP_REPO" > /etc/profile.d/envvar-sshd.sh
echo "export REMOTE_BACKUP_REPO=$DCK_REMOTE_BACKUP_REPO" >> /etc/profile.d/envvar-sshd.sh

exec "$@"
