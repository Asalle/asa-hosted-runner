# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Update package list and install wget
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Verify wget is installed and working
RUN wget --version && \
    echo "wget is successfully installed and ready to fetch from the internet"

# Set a default command that demonstrates wget usage
# When running the container, you can execute:
# docker run <image> wget -O - https://example.com/
CMD ["/bin/bash"]
