# Even though we cache node_modules/bower_components, npm/bower install is still slow.
# This allows us to only run npm/bower install when necessary.
# We stash the json file back in the cached directory.

# Read mode passed in as first argument
mode=$1

# Verify npm or bower scenario
case $mode in
  npm)
    json_file="package.json"
    cache_dir="node_modules"
    ;;
  bower)
    json_file="bower.json"
    cache_dir="bower_components"
    ;;
  *)
    echo "Unknown install mode: $mode"
    exit 1
    ;;
esac

pwd
echo $TRAVIS_BUILD_DIR

# Verify cache directories exist and no difference in config files
if [[ -d "../$cache_dir" ]] && cmp --silent ../$json_file ../$cache_dir/$json_file; then
  echo "$mode install successfully bypassed with cache."
else
  echo "Unable to use cache for $mode.  Beginning install now."
  $mode install
  echo "Caching $json_file for future builds."
  cp ../$json_file ../$cache_dir/$json_file
  cat ../$cache_dir/$json_file
fi
