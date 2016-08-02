FROM cyfdecyf/java

# Define working directory.
WORKDIR /data

# Define commonly used hadoop variable
ENV HADOOP_HOME /data/hadoop-2.7.2
ENV HADOOP_CONFIG_HOME $HADOOP_HOME/etc/hadoop
ENV PATH $HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

COPY . /data/

RUN \
  rm -f Dockerfile && \
  rm -f /etc/service/sshd/down && \
  /etc/my_init.d/00_regen_ssh_host_keys.sh && \
  ssh-keygen -t rsa -P '' -f ~/.ssh/id_dsa && \
  cp ~/.ssh/id_dsa.pub ~/.ssh/authorized_keys && \
  mv ./setup_hosts.sh /etc/my_init.d/10_setup_hosts.sh && \
  \
  curl 'http://192.168.2.9:8000/hadoop-2.7.2.tar.gz' -o hadoop-2.7.2.tar.gz && \
  tar xzf hadoop-2.7.2.tar.gz && \
  rm -f hadoop-2.7.2.tar.gz && \
  cp -r etc hadoop-2.7.2/ && \
  rm -rf etc && \
  \
  mkdir hdfs && \
  mkdir hdfs/tmp && \
  mkdir hdfs/namenode hdfs/namenode2 && \
  mkdir hdfs/datanode && \
  hdfs namenode -format && \
  \
  apt-get update && \
  apt-get install -y htop

