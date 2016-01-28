set -e

echo -e "blackbaud-skyux\n$NPM_PASSWORD\nsky-build-user@blackbaud.com" | npm login
npm whoami
npm publish
