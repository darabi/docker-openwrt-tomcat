Apache Tomcat Server as a Docker container. For development use only.

## Quickstart
This docker exposes port number: 8080.
### To run normally:
```
docker run -d -p 8080:8080 mcreations/openwrt-tomcat
```
You can use an internet browser for checking the running docker as follows:
```
https://localhost:8080/
```
### To use jconsole to monitor the JVM

```
docker run -d -p 8080:8080 -p 6970:6970 \
            -e JAVA_RMI_SERVER_HOSTNAME="$HOSTNAME" \
             mcreations/openwrt-tomcat
```
Connecting from jconsole:
```
jconsole localhost:6970
```

### To remote debug
```
docker run -it -p 8080:8080 -p 6970:6970 -p 8000:8000 \
            -e JPDA_START=true \
            -e JAVA_RMI_SERVER_HOSTNAME="$HOSTNAME" \
             mcreations/openwrt-tomcat
```
The remote debug settings in eclipse:
```
hostname: localhost
port: 8000
ConnectionType: Standard(Socket Attach)
```

## Build

In the root of cloned project run following command 

```
docker build -t mcreations/openwrt-tomcat .
```