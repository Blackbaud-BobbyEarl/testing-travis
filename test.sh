#!/usr/bin/env bash
set -e

echo -e "Blackbaud - SKY UX Travis - After Success"

# Necessary to stop pull requests from forks from running outside of Savage
# Publish a tag to NPM
if [[ $NPM_TOKEN ]]; then
  echo -e "Using NPM_TOKEN"
elif [[ $NPM_PASSWORD ]]; then
  echo -e "USING NPM_PASSWORD"
else
  echo -c "No credentials provided"
fi