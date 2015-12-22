FROM liyp/oraclejdk:7

MAINTAINER liyp <liyp.yunpeng@gmail.com>

ENV \
  MAVEN_VERSION="3.3.9" \
  M2_HOME=/opt/mvn

RUN \
  apt-get update && apt-get -y upgrade && \
  apt-get install -y wget

RUN \
  cd /tmp && \
  wget "http://mirrors.aliyun.com/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" && \
  tar xzf "apache-maven-${MAVEN_VERSION}-bin.tar.gz" -C /opt && \
  ln -s "apache-maven-${MAVEN_VERSION}" $M2_HOME

RUN \
  apt-get remove -y wget && apt-get -y autoremove && apt-get -y autoclean && \
  rm /tmp/*

ENV PATH=$M2_HOME/bin:$PATH
