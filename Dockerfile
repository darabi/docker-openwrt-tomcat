## -*- docker-image-name: "mcreations/openwrt-tomcat" -*-

FROM mcreations/openwrt-java:8

MAINTAINER Reza Rahimi <rahimi@m-creations.net>

ENV TOMCAT_VERSION=8.0.27

ENV TOMCAT_HOME /opt/apache-tomcat-${TOMCAT_VERSION}

ENV DIST_DIR /mnt/packs

ADD image/root /

RUN mkdir -p /mnt/packs

ADD dist/ /mnt/packs

# Download TOMCAT and installing it
RUN opkg update && \
  opkg install libapr libaprutil && \
  export TOMCAT_MAJOR_VERSION=`echo "$TOMCAT_VERSION" | cut -d. -f1` && \
  ([ -f $DIST_DIR/apache-tomcat-${TOMCAT_VERSION}.tar.gz ] ||  wget -O $DIST_DIR/apache-tomcat-${TOMCAT_VERSION}.tar.gz --progress=dot:giga http://apache.openmirror.de/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz) && \
  tar -C /tmp -xvzf $DIST_DIR/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
  rm $DIST_DIR/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
  mv -f /tmp/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME} && \
  rm -f ${TOMCAT_HOME}/bin/*.bat && \
  echo "export PATH=$PATH:$JAVA_HOME/bin/bundled:${TOMCAT_HOME}/bin" >> /etc/profile && \
  echo "export TOMCAT_HOME=${TOMCAT_HOME}" >> /etc/profile

# Expose port
EXPOSE 8080

CMD ["/start-tomcat"]