# docker-coredns-flatten
Simple Docker image to run CoreDNS with CNAME Flattening plugin enabled.

This build of CoreDNS utilizes the [flatten](https://github.com/litobro/flatten) plugin to provide RFC 1034 compliant CNAME flattening, similar to the [Cloudflare](https://developers.cloudflare.com/dns/cname-flattening/) implementation. 

## Usage
A sample docker-compose and Corefile are included which provide minimal functionality to demonstrate running the image. Update the Corefile as necessary for your use cases.

## TODO
- Write unit tests
- Update CI/CD to automatically update the last build version of CoreDNS