## -*- docker-image-name: "mcreations/openwrt-tomcat" -*-

FROM mcreations/openwrt-java:8

MAINTAINER Reza Rahimi <rahimi@m-creations.net>

ENV TOMCAT_VERSION=8.0.27

ENV CATALINA_HOME /opt/apache-tomcat-${TOMCAT_VERSION}

ENV DIST_DIR /mnt/packs

ADD image/root /

RUN mkdir -p /mnt/packs

ADD dist/ /mnt/packs

ENV MAX_THREADS 200
ENV MAX_CONNECTIONS 1000
ENV ACCEPT_COUNT 100
ENV MIN_SPARE_THREADS 100

ENV JVM_ARG_XMS 128m
ENV JVM_ARG_XMX 256m
ENV JVM_ARG_XSS 128m

ENV JMX_PORT 6970
EXPOSE 6970

ENV JPDA_ADDRESS=8000
ENV JPDA_TRANSPORT=dt_socket

# Download TOMCAT and installing it
RUN opkg update && \
  opkg install libapr libaprutil && \
  export TOMCAT_MAJOR_VERSION=`echo "$TOMCAT_VERSION" | cut -d. -f1` && \
  ([ -f $DIST_DIR/apache-tomcat-${TOMCAT_VERSION}.tar.gz ] ||  wget -O $DIST_DIR/apache-tomcat-${TOMCAT_VERSION}.tar.gz --progress=dot:giga http://apache.openmirror.de/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz) && \
  tar -C /tmp -xvzf $DIST_DIR/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
  rm $DIST_DIR/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
  mv -f /tmp/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME} && \
  rm -f ${CATALINA_HOME}/bin/*.bat && \
  echo "export PATH=$PATH:$JAVA_HOME/bin/bundled:${CATALINA_HOME}/bin" >> /etc/profile && \
  echo "export CATALINA_HOME=${CATALINA_HOME}" >> /etc/profile


# Expose port
EXPOSE 8080

CMD ["/start-tomcat"]
