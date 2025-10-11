# docker-nginx-reverse-proxy

![Docker Pulls](https://img.shields.io/github/v/release/veka-server/docker-nginx-reverse-proxy?label=GHCR) ![Build Docker](https://github.com/veka-server/docker-nginx-reverse-proxy/actions/workflows/build-central.yml.yml/badge.svg)

```bash
$ docker pull ghcr.io/veka-server/docker-nginx-reverse-proxy:latest
```

Liste des images :
https://github.com/users/veka-server/packages/container/package/docker-nginx-reverse-proxy

## Usage

Build image:
```
docker build -t nginx-reverse-proxy https://github.com/veka-server/docker-nginx-reverse-proxy.git#main
```

Creer le reseau isoler si necessaire:
```
docker network create reseaux_sans_internet
```

Basic example:
```
docker run \
--net reseaux_sans_internet \
--restart unless-stopped \
-p 80:80  \
-p 443:443  \
--name nginx-reverse-proxy \
-d nginx-reverse-proxy; \
docker network connect bridge nginx-reverse-proxy
```
