# Use the official Ubuntu 24.04 base image
FROM ubuntu:24.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the repository and install wget
# We combine commands and clean the cache to keep the image lean
RUN apt-get update && apt-get install -y \
    curl \
    patch \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*



# 3. All following commands run as 'ubuntu'
WORKDIR /home/ubuntu

# Create a folder
RUN mkdir actions-runner && cd actions-runner
# Download the latest runner package
RUN curl -o actions-runner-linux-x64-2.331.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.331.0/actions-runner-linux-x64-2.331.0.tar.gz
# Extract the installer
RUN tar xzf ./actions-runner-linux-x64-2.331.0.tar.gz

# Install Dotnet Core 6.0 D:
RUN ./bin/installdependencies.sh

COPY . .

RUN patch -p1 < 0001-Add-a-post-completion-hook-to-clean-up-the-work-dir.patch

# Chown to ubuntu
RUN chown -R ubuntu:ubuntu /home/ubuntu

RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 2. Set the user to 'ubuntu' (UID 1000)
USER ubuntu

#RUN ./config.sh --url https://github.com/canonical/renesas-bootassets --token ABF6TYSY5D5J4GY6NWJVOS3JPOLNS --unattended --name asa-hosted --labels Linux,noble,ARM64

ENV ACTIONS_RUNNER_HOOK_JOB_COMPLETED=/home/ubuntu/hooks/job_completed.hook
CMD ["./config.sh", "--url", "https://github.com/canonical/renesas-bootassets", "--token", "ABF6TYSY5D5J4GY6NWJVOS3JPOLNS", "--unattended", "--name", "asa-hosted1", "--labels", "Linux,noble,ARM64", "&&", "./run.sh"]
