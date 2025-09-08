#!/bin/bash
if [[ -z "${DOPPLER_TOKEN:-}" ]]; then
	echo "❌ DOPPLER_TOKEN is not set!"
	exit 1
fi

echo "🔑 DOPPLER_TOKEN length: ${#DOPPLER_TOKEN}"

# install gpg
if ! command -v gpg >/dev/null 2>&1; then
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y gnupg
  elif command -v brew >/dev/null 2>&1; then
    brew install gnupg
  fi
fi

# Install Doppler CLI
curl -Ls https://cli.doppler.com/install.sh | sh

# fetch env
doppler secrets download \
  --project "${DOPPLER_PROJECT}" \
  --config "${DOPPLER_CONFIG}" \
  --no-file \
  --format env > "${BITRISE_SOURCE_DIR}/.env"

echo "🎉 .env file generated successfully!"
