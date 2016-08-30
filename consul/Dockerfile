FROM cyfdecyf/baseimage:0.9.18

COPY ./setup_hosts.sh /etc/my_init.d/10_setup_hosts.sh

RUN \
  rm -f Dockerfile && \
  rm -f /etc/service/sshd/down && \
  /etc/my_init.d/00_regen_ssh_host_keys.sh && \
  ssh-keygen -t rsa -P '' -f ~/.ssh/id_dsa && \
  cp ~/.ssh/id_dsa.pub ~/.ssh/authorized_keys && \
  \
  curl 'http://192.168.2.9:8000/consul' -o /usr/local/bin/consul && \
  chmod a+rx /usr/local/bin/consul && \
  \
  apt-get update && \
  apt-get install -y htop

