#
# Oracle Java 8 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java8
#
# Modified by CYF.

# Pull base image.
FROM cyfdecyf/baseimage

# Download jdk manually and use it.
#  mkdir /var/cache/oracle-jdk8-installer && \
#  curl 'http://192.168.1.5:8000/jdk-8u45-linux-x64.tar.gz' -o /var/cache/oracle-jdk8-installer/jdk-8u45-linux-x64.tar.gz && \

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

