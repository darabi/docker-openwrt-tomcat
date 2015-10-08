Apache Tomcat Server as a Docker container. For development use only.

## Quickstart
This docker expose port number: 8080.
To run
```
docker run -p 8080:8080 -d mcreations/openwrt-tomcat
```
You can use an internet browser for checking the run docker as follows:
```
https://localhost:8080/
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