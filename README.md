# asa-hosted-runner
Docker image for a self-hosted github runner that cleans up after itself

How to run:
```
udo docker run asa-hosted-runner sh -c "./config.sh --url https://github.com/canonical/renesas-bootassets --token ABF6TYSY5D5J4GY6NWJVOS3JPOLNS --unattended --name asa-hosted5 --labels Linux,noble,ARM64 && ./run.sh"
```

Put your own token and label there
