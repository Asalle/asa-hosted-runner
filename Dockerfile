# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Update package list and install wget
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Default command starts an interactive bash shell
# To use wget directly, pass commands as arguments:
# docker run <image> wget -O - https://example.com/
CMD ["/bin/bash"]
