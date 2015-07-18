FROM phusion/baseimage:0.9.17

# Change source.list
RUN \
  mv /etc/apt/sources.list /etc/apt/bak-sources.list && \
  curl 'http://mirrors.163.com/.help/sources.list.trusty' -o /etc/apt/sources.list

