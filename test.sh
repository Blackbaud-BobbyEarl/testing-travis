#!/usr/bin/env bash
set -e

echo -e "Blackbaud - SKY UX Travis - After Success"

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

gem install travis
login=$(travis raw /v3/build/$TRAVIS_BUILD_ID --json --skip-completion-check | jq -r '.created_by.login')
loginUpper=${login^^}

if [[ "${SKYUX_TEAM[@]}" =~ "${loginUpper}" ]]; then
  echo -e "${loginUpper} has permission to release."
else
  echo -e "${loginUpper} lacks permission to release.  Please contact the SKY UX team."
fi