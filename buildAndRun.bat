@echo off
call mvn clean package
call docker build -t ragnarook/consultorioONLINE .
call docker rm -f consultorioONLINE
call docker run -d -p 9080:9080 -p 9443:9443 --name consultorioONLINE ragnarook/consultorioONLINE