FROM golang:latest as builder
LABEL maintainer="Thomas Dang"

# Set workdir inside the container
WORKDIR /go/src/coredns

# Install curl and jq to parse JSON from GitHub API
RUN apt-get update && apt-get install -y curl jq

# Get the latest CoreDNS release tag from GitHub API and download src
RUN LATEST_RELEASE=$(curl -s "https://api.github.com/repos/coredns/coredns/releases/latest" | jq -r .tag_name) && \
    curl -L "https://github.com/coredns/coredns/archive/${LATEST_RELEASE}.tar.gz" -o coredns.tar.gz && \
    tar -xzf coredns.tar.gz --strip-components=1 && \
    rm coredns.tar.gz

# Add Flatten plugin after 'cache:cache'
RUN sed -i '/cache:cache/a flatten:github.com/litobro/flatten' plugin.cfg

# Build CoreDNS
RUN make

# Use scratch for a minimal production image
FROM scratch

# Copy the CoreDNS binary from the builder stage
COPY --from=builder /go/src/coredns/coredns /coredns

# Expose the DNS port
EXPOSE 53 53/udp

# Run CoreDNS
ENTRYPOINT ["/coredns"]