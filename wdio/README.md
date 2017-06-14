## WebdriverIO tests

1. Download [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
1. Execute `./chromedriver --url-base=/wd/hub --port=4444` from the directory ChromeDriver was downloaded to.
1. Execute tests with `./node_modules/.bin/wdio wdio.conf.js`.

Note: You will have 2 terminal tabs open: One with the ChromeDriver and the second with the executed tests.
