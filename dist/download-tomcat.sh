#!/bin/bash
# Download and place tomcat packs in this dist/ directory to avoid multiple times download.

TOMCAT_VERSION=8.0.27
TOMCAT_MAJOR_VERSION=`echo "$TOMCAT_VERSION" | cut -d. -f1`
TOMCAT_NATIVE_VERSION=1.1.33

wget -O apache-tomcat-${TOMCAT_VERSION}.tar.gz --progress=dot:giga http://apache.openmirror.de/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

#wget -O tomcat-native-${TOMCAT_NATIVE_VERSION}-src.tar.gz --progress=dot:giga  http://apache.openmirror.de/tomcat/tomcat-connectors/native/${TOMCAT_NATIVE_VERSION}/source/tomcat-native-${TOMCAT_NATIVE_VERSION}-src.tar.gz
