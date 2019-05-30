#!/usr/bin/env bash
set -e

echo -e "Blackbaud - SKY UX Travis - After Success"
packageNameBash="$(jq -r ".name" package.json)"
packageNameNode="$(node -pe "require('./package.json')['name']")"

echo packageNameBash
echo packageNameNode

# Necessary to stop pull requests from forks from running outside of Savage
# Publish a tag to NPM
#if [[ $NPM_TOKEN ]]; then
#  echo -e "Using NPM_TOKEN"
#elif [[ $NPM_PASSWORD ]]; then
#  echo -e "USING NPM_PASSWORD"
#else
#  echo -c "No credentials provided"
#fi
SKYUX_TEAM=(
  BLACKBAUD-BOBBYEARL
  BLACKBAUD-TERRYHELEMS
  BLACKBAUD-STEVEBRUSH
  BLACKBAUD-ALEXKINGMAN
  BLACKBAUD-TREVORBURCH
)

# Install the TravisCI CLI so we can easily make API calls.
gem install travis

# Read the uppercase GitHub username that initiated the build.
CREATED_BY=$(travis raw /v3/build/$TRAVIS_BUILD_ID --json --skip-completion-check | jq -r '.created_by.login' | tr 'a-z' 'A-Z' )

# The spaces here are extremely important as they stop false positives.
# For example, without them, "user" would match "username".
if [[ " ${SKYUX_TEAM[@]} " =~ " ${CREATED_BY} " ]]; then
  echo -e "${CREATED_BY} has permission to release."
else
  echo -e "${CREATED_BY} lacks permission to release.  Please contact the SKY UX team."
fi
