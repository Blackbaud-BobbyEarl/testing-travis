set -e

declare -a arr=('TRAVIS_REPO_SLUG' 'TRAVIS_SECURE_ENV_VARS' 'TRAVIS_BRANCH' 'TRAVIS_PULL_REQUEST' 'TRAVIS_OS_NAME' 'TRAVIS_TAG' 'TRAVIS_JOB_NUMBER' 'TRAVIS_BUILD_NUMBER' 'TRAVIS_COMMIT' 'LAST_COMMIT_MESSAGE' 'RELEASE_VERSION' 'IS_RELEASE')
for i in "${arr[@]}"
do
   echo "$i: ${!i}"
done

# Only build on releases
if [ "$TRAVIS_TAG" != "" ]; then
   echo "I AM A TAG!"
fi

if [[ -n "$TRAVIS_TAG" ]]; then echo "I AM ANOTHER WAY TO TEST THAT THIS IS A TAG"; fi

if [[ $IS_RELEASE ]]; then
  echo "I AM A RELEASE"
  tag="$RELEASE_VERSION"
else
  echo "I AM NOT, REPEAT NOT, A RELEASE"
  tag="dev"
fi

echo $tag

echo "TESTING VARS"
branch="$TRAVIS_BUILD_NUMBER-webdriver"
branch="$branch-savage"
echo $branch

