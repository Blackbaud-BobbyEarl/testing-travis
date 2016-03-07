# Even though we cache node_modules/bower_components, npm/bower install is still slow.
# This allows us to only run npm/bower install when necessary.
# Assumes either "npm" or "bower" is passed in as first argument.
#Arbitrary change

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

echo "CURRENT WORKING DIRECTORY IS"
pwd

if [[ -d "$HOME/$cache_dir" ]]; then
  echo "$HOME/$cache_dir exists"

  if [[ -d "$CONFIG_CACHE" ]]; then
    echo "$CONFIG_CACHE dir exists"

    if [[ "$(cmp --silent $HOME/$json_file $CONFIG_CACHE/$json_file)" ]]; then
      echo "$mode install successfully bypassed with cache."
    else
      echo "cmp failed"
      cmp $HOME/$json_file $CONFIG_CACHE/$json_file
    fi
  else
    echo "$CONFIG_CACHE dir does not exist"
  fi
else
  echo "$HOME/$cache_dir does not exist"
fi
