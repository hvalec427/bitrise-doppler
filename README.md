envs:

# Doppler Bitrise Step

This Bitrise step fetches environment variables from Doppler and generates a `.env` file for your project.

## Usage

1. Add this step to your Bitrise workflow.
2. Set the required inputs:
   - **DOPPLER_TOKEN**: Your Doppler service token (recommended to set as a Bitrise Secret).
   - **DOPPLER_PROJECT**: The name of your Doppler project.
   - **DOPPLER_CONFIG**: The Doppler config/environment to use (e.g., `prd`).

Example step configuration in your `bitrise.yml`:
```yaml
- git::https://github.com/hvalec427/bitrise-doppler.git@master:
    title: Fetch Doppler Secrets
    inputs:
      - DOPPLER_TOKEN: $DOPPLER_TOKEN
      - DOPPLER_PROJECT: $DOPPLER_PROJECT
      - DOPPLER_CONFIG: $DOPPLER_CONFIG
```

### What this step does

- Installs the Doppler CLI.
- Authenticates using your Doppler token.
- Downloads secrets for the specified project and config.
- Outputs a `.env` file in your repository.

### Requirements

- The Doppler token must have access to the specified project and config.
- The step requires internet access to install the Doppler CLI and fetch secrets.
