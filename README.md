Apache Tomcat Server as a Docker container. For development use only.

## Quickstart
This docker expose port number: 8080.
### To run normally:
```
docker run -d -p 8080:8080 mcreations/openwrt-tomcat
```
You can use an internet browser for checking the run docker as follows:
```
https://localhost:8080/
```
### To use jconsole to monitoring JVM:

```
docker run -d -p 8080:8080 -p 6970:6970 \
            -e JAVA_RMI_SERVER_HOSTNAME="$HOSTNAME" \
             mcreations/openwrt-tomcat
```
Connecting from jconsole:
```
jconsole localhost:6970
```

### To remote debug:
```
docker run -it -p 8080:8080 -p 6970:6970 -p 8000:8000 \
            -e JPDA_START=true \
            -e JAVA_RMI_SERVER_HOSTNAME="$HOSTNAME" \
             mcreations/openwrt-tomcat
```
The remote debug settings in eclipse:
```
<launchConfiguration type="org.eclipse.jdt.launching.remoteJavaApplication">
...
<mapAttribute key="org.eclipse.jdt.launching.CONNECT_MAP">
hostname: localhost
port: 8000
ConnectionType: Standard(Socket Attach)
>

```


## Distribution Folder
To avoid downloading the artifact multiple times, you can download it manually into dist folder, you can use `download-tomcat.sh` inside dist for download the artifact .
```
cd /path/to/yours/docker-opewrt-tomcat/dist
sh download-tomcat.sh
```
You can modify artifact version in download-tomcat.sh file, the default version is 8.0.27.

## Build
In the root of cloned project run following command 
```
docker build -t mcreations/openwrt-tomcat .
```