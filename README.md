# Docker image for minisatip and sundtek

https://github.com/svenihoney/minisatip-sundtek-docker

[![GitHub Stars](https://img.shields.io/github/stars/svenihoney/minisatip-sundtek-docker.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/svenihoney/minisatip-sundtek-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/svenihoney/minisatip-sundtek-docker.svg?style=flat-square&color=E68523&label=pulls&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/svenihoney/minisatip-sundtek-docker)
[![Docker Stars](https://img.shields.io/docker/stars/svenihoney/minisatip-sundtek-docker.svg?style=flat-square&color=E68523&label=stars&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/svenihoney/minisatip-sundtek-docker)
[![Build Status](https://ci.linuxserver.io/view/all/job/Docker-Pipeline-Builders/job/docker-minisatip/job/master/badge/icon?style=flat-square)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-minisatip/job/master/)

[Minisatip](https://github.com/catalinii/minisatip) is a multi-threaded satip server version 1.2 that runs under Linux and it was tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards.

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=minisatip \
  -e RUN_OPTS=<parameter> \
  -p 8080:8080 \
  -p 554:554 \
  -p 1900:1900/udp \
  --restart unless-stopped \
  svenihoney/minisatip-sundtek
```

### Additional runtime parameters

In some cases it might be necessary to start minisatip with additional parameters, for example to configure a unicable LNB. Add the parameters you need and restart the container. Be sure to have the right parameters set as adding the wrong once might lead to the container not starting correctly.
For a list of minisatip parameters visit [Minisatip](https://github.com/catalinii/minisatip) page.


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  minisatip:
    image: svenihoney/minisatip-sundtek
    container_name: minisatip
    environment:
      - RUN_OPTS=<parameter>
    ports:
      - 8080:8080
      - 554:554
      - 1900:1900/udp
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8080` | Status Page WebUI |
| `-p 554` | RTSP Port |
| `-p 1900/udp` | App Discovery |
| `-e RUN_OPTS=<parameter>` | Specify specific run params for minisatip |
