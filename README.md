# docker-nginx-reverse-proxy

## Usage

Build image:
```
docker build -t nginx-reverse-proxy https://github.com/veka-server/docker-nginx-reverse-proxy.git#main
```

Basic example:
```
docker run --gpus all --restart unless-stopped -p 6080:6080 --name nginx-reverse-proxy -d comfyui
```

```
docker run \
--net reseaux_sans_internet \
--restart unless-stopped \
-p 80:80  \
--name nginx-reverse-proxy \
-d nginx-reverse-proxy; \
docker network connect bridge nginx-reverse-proxy
```
