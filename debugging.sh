declare -a arr=("TRAVIS_PULL_REQUEST" "TRAVIS_OS_NAME" "TRAVIS_TAG")
for i in "${arr[@]}"
do
   echo "$i: ${!i}"
done
