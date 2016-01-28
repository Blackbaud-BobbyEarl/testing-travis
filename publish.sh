set -e

echo -e "blackbaud-bobbyearl\n$NPM_PASSWORD\nbobby.earl@blackbaud.com" | npm login
npm whoami
npm publish
