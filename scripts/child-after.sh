echo "BROWSER_STACK_PID is $BROWSER_STACK_PID"

wget https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip
unzip BrowserStackLocal-linux-x64.zip
./BrowserStackLocal -v -onlyAutomate -forcelocal $BROWSER_STACK_ACCESS_KEY &

echo "--- Before ---"
ps -ef | grep BrowserStackLocal
pkill -f BrowserStackLocal

echo "--- After ---"
ps -ef | grep BrowserStackLocal
