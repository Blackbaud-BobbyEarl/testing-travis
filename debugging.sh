declare -a arr=('TRAVIS_PULL_REQUEST' 'TRAVIS_OS_NAME' 'TRAVIS_TAG' 'TRAVIS_JOB_NUMBER' 'TRAVIS_BUILD_NUMBER')
for i in "${arr[@]}"
do
   echo "$i: ${!i}"
done
