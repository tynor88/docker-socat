# docker-socat
[![Docker Pulls](https://img.shields.io/docker/pulls/tynor88/socat.svg)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/tynor88/socat.svg)][hub]
[![Docker Build](https://img.shields.io/docker/automated/tynor88/socat.svg)][hub]
[![Docker Layers](https://images.microbadger.com/badges/image/tynor88/socat.svg)][hub]
[![Docker Version](https://images.microbadger.com/badges/version/tynor88/socat.svg)][hub]
[hub]: https://hub.docker.com/r/tynor88/socat/

socat is a relay for bidirectional data transfer between two independent data
channels. Each of these data channels may be a file, pipe, device (serial line
etc. or a pseudo terminal), a socket (UNIX, IP4, IP6 - raw, UDP, TCP), an
SSL socket, proxy CONNECT connection, a file descriptor (stdin etc.), the GNU
line editor (readline), a program, or a combination of two of these. 
These modes include generation of "listening" sockets, named pipes, and pseudo
terminals.

socat can be used, e.g., as TCP port forwarder (one-shot or daemon), as an
external socksifier, for attacking weak firewalls, as a shell interface to UNIX
sockets, IP6 relay, for redirecting TCP oriented programs to a serial line, to
logically connect serial lines on different computers, or to establish a
relatively secure environment (su and  chroot) for running client or server
shell scripts with network connections. 

In the context of docker, socat is commonly used to open up network connectivity
to docker containers after they have been started, when ports were not mapped
originally.  This can be useful, for example, in development, when exact ports
may not be known at the time the original docker container is created.

## Usage

```
docker run \
  --name=socat \
  -e LISTEN_PORT=<listening port> \
  -e FORWARD_PORT=<forwarding / redirect port> \
  --link <name of target docker container>:target_app \
  -p <listening port>:<listening port>
  tynor88/socat
```

**Parameters**

* `-e LISTEN_PORT` The port to listen for TCP4 connections
* `-e FORWARD_PORT` The port to redirect / forward TCP4 connections to
* `--link  __:target_app` The name of the docker container onto which you are targeting the connections to
## Info

* Shell access whilst the container is running: `docker exec -it socat /bin/ash`
* Upgrade to the latest version: `docker restart socat`
* To monitor the logs of the container in realtime: `docker logs -f socat`

## Versions

+ **2016/09/01:**
  * Initial release
+ **2017/01/24:**
  * Added flexibility to target specified docker container
