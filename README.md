# docker-coredns-flatten
Simple Docker image to run CoreDNS with CNAME Flattening plugin enabled.

This build of CoreDNS utilizes the [flatten](https://github.com/litobro/flatten) plugin to provide RFC 1034 compliant CNAME flattening, similar to the [Cloudflare](https://developers.cloudflare.com/dns/cname-flattening/) implementation. 

## Usage
A sample docker-compose and Corefile are included which provide minimal functionality to demonstrate running the image. Update the Corefile as necessary for your use cases.

Pull the image from docker hub and use the docker-compose.yml file as a guide. 
```
docker pull litobro/coredns-flatten:latest
```

The `latest` tag tracks the most recent build against the most recent version of CoreDNS. Version number tags reflect the CoreDNS version number built against. `nightly` tracks the main branch of this repository.

## TODO
- Write unit tests
- Update CI/CD to automatically update the last build version of CoreDNS