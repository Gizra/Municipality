#!/usr/bin/env bash
set -e

# We should not run the current test under the WebDriverIO build.
if [ "${BUILD_WEBDRIVERIO}" == 1 ]; then
 exit 0;
fi

# Load helper functionality.
source helper_functions.sh

# -------------------------------------------------- #
# Installing Firefox (iceweasel).
# -------------------------------------------------- #
echo -e "\n${BGCYAN}[RUN] Install firefox. ${RESTORE}"
apt-get update
apt-get -qq -y install iceweasel > /dev/null

# -------------------------------------------------- #
# Installing headless GUI for browser.'Xvfb is a
# display server that performs graphical operations
# in memory'.
# -------------------------------------------------- #
echo -e "\n [RUN] Installing XVFB (headless GUI for Firefox).\n"
apt-get install xvfb -y
apt-get install openjdk-7-jre-headless -y
Xvfb :99 -ac &
export DISPLAY=:99
sleep 5

# -------------------------------------------------- #
# Install Selenium.
# -------------------------------------------------- #
echo -e  "\n${BGCYAN}[RUN] Install Selenium. ${RESTORE}"
wget http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.0.jar
java -jar selenium-server-standalone-2.53.0.jar > /dev/null 2>&1 &
sleep 10

# -------------------------------------------------- #
# Installing Behat.
# -------------------------------------------------- #
print_message "Install behat."
cd "$ROOT_DIR"/server/behat
curl -sS https://getcomposer.org/installer | php
php composer.phar install
check_last_command
cp behat.local.yml.travis behat.local.yml

# -------------------------------------------------- #
# Run tests
# -------------------------------------------------- #
print_message "Run Behat tests."
./bin/behat --tags=~@wip

if [ $? -ne 0 ]; then
  print_error_message "Behat failed."
  exit 1
fi

exit 0
