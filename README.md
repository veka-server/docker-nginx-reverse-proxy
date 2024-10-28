# docker-nginx-reverse-proxy

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
