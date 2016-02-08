set -e

#echo -e "blackbaud-bobbyearl\n$NPM_PASSWORD\nbobby.earl@blackbaud.com" | npm login
#npm whoami
#npm publish

export RELEASE_VERSION=1.2.3
echo BEFORE
cat README.md
sed -i'' -E -e 's/blackbaudcdn.net\/skyux\/[0-9]+\.[0-9]+\.[0-9]+\//blackbaudcdn.net\/skyux\/'"$RELEASE_VERSION"'\//g' README.md
echo "AFTER"
cat README.md
ls -la
