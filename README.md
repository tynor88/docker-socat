# docker-socat
[![Docker Pulls](https://img.shields.io/docker/pulls/tynor88/socat.svg)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/tynor88/socat.svg)][hub]
[![Docker Build](https://img.shields.io/docker/automated/tynor88/socat.svg)][hub]
[![Docker Layers](https://images.microbadger.com/badges/image/tynor88/socat.svg)][hub]
[![Docker Version](https://images.microbadger.com/badges/version/tynor88/socat.svg)][hub]
[hub]: https://hub.docker.com/r/tynor88/socat/

Keep your DNS records for your own domains updated with this UnoEuro DDNS script. UnoEuro provides a free DNS service for your private domains. You can move all your domains for free and have them managed at UnoEuro.

## Usage

```
docker create \
  --name=socat \
  -e DOMAIN=<domain> \
  -e HOSTNAME=<hostname> \
  -e APIKEY=<apikey> \
  -e PUSHBULLET_ACCESS_TOKEN=<access_token>
  tynor88/socat
```

**Parameters**

* `-e DOMAIN` The name of the domain (product) you wish to update (without www). Can be in punycode format. Ie. "example.com"
* `-e HOSTNAME` The name of the A record you wish to update. The domain should not be appended to this. Ie. use "home", not "home.example.com"
* `-e APIKEY` The API key for the UnoEuro account. Found in UnoEuro's controlpanel
* `-e PUSHBULLET_ACCESS_TOKEN` The access token for the Pushbullet API. Found on https://www.pushbullet.com/#settings/account . Leave empty for disabling this feature.

## Setting up the application

Make sure your domain's DNS is managed by UnoEuro and retrieve your Api-key (https://www.unoeuro.com/controlpanel/account.php). Then run the docker create command above with your domain, hostname and apikey  
It will update your IP with the UnoEuro DNS service every 5 minutes. Optionally specify your Pushbullet access token to receive notifications if the IP was updated or something went wrong.

## Info

* Shell access whilst the container is running: `docker exec -it UnoEuroDNS /bin/bash`
* Upgrade to the latest version: `docker restart UnoEuroDNS`
* To monitor the logs of the container in realtime: `docker logs -f UnoEuroDNS`

## Versions

+ **2016/09/02:**
  * Fixed a response check, as UnoEuro's Api changed
+ **2016/07/10:**
  * Added support for Pushbullet notifications (optional)
  * Update to latest phusion baseimage (0.9.19)
+ **2016/04/29:**
  * Initial release
