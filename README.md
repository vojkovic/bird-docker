# bird-docker

bird-docker is a Docker image for the [BIRD Internet Routing Daemon](http://bird.network.cz/). The image is based on the [Alpine Linux](https://alpinelinux.org/) distribution.


## Usage

To run the container from the build vojkovic/bird image, use the following command:

```bash
docker run -d --name bird --network host --restart always -v /path/to/bird.conf:/etc/bird/bird.conf ghcr.io/vojkovic/bird-docker:latest
```

The container will run in the background and will use the host network stack. The BIRD configuration file should be mounted to `/etc/bird/bird.conf` in the container.

Docker compose example:

```yaml
version: '3'

services:
  bird:
    image: ghcr.io/vojkovic/bird-docker:latest
    network_mode: host
    restart: always
    volumes:
      - /path/to/bird.conf:/etc/bird/bird.conf
```