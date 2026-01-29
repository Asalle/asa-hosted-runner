# Docker Image Usage

This Docker image is based on Ubuntu 24.04 and includes wget for fetching content from the internet.

## Building the Image

```bash
docker build -t asa-hosted-runner .
```

## Running the Image

### Interactive Shell
```bash
docker run -it asa-hosted-runner
```

### Fetch a file from the internet using wget
```bash
docker run --rm asa-hosted-runner wget -O - https://example.com/
```

### Download a file to a local directory
```bash
docker run --rm -v $(pwd):/output asa-hosted-runner wget -O /output/file.txt https://example.com/file.txt
```

## Features

- **Base Image**: Ubuntu 24.04 LTS (Noble Numbat)
- **wget**: Pre-installed and ready to use for fetching content from the internet
- **Clean Image**: Unnecessary package lists are removed to keep the image size small
