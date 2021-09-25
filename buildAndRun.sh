#!/bin/sh
mvn clean package && docker build -t ragnarook/consultorioONLINE .
docker rm -f consultorioONLINE || true && docker run -d -p 9080:9080 -p 9443:9443 --name consultorioONLINE ragnarook/consultorioONLINE