#!/usr/bin/env bash

# Load helper functionality.
cd ci-scripts/docker_files


if [ -z "$DOCKER_DEBUG" ]; then
  # Regular Travis execution, failing on the first error is what we want.
  bash preparing_server.sh
  bash run_webdriverio.sh
  bash run_behat.sh
  bash run_simpletest.sh

else
  # We keep going and open a Bash shell to interactively inspect what failed or
  # what's the status of the application.
  bash preparing_server.sh || :
  bash run_webdriverio.sh || :
  bash run_behat.sh || :
  bash run_simpletest.sh || :

  bash
fi
