#!/bin/sh

# ---------------------------------------------------------------------------- #
#
# Run the ShellCheck review.
#
# ---------------------------------------------------------------------------- #

# Check the current build.
if [ -z "${SHELL_REVIEW+x}" ] || [ "$SHELL_REVIEW" -ne 1 ]; then
 exit 0;
fi

HAS_ERRORS=0

code_review () {
  echo "${LWHITE}$1${RESTORE}"
  # The exclusions are to ignore errors related to including other shell scripts
  # and allowing "cd dir" without explicit error handling.
  if ! docker run -v "$TRAVIS_BUILD_DIR":/scripts koalaman/shellcheck -e SC1091,SC1090,SC2181,SC2164 /scripts/"$1"; then
    HAS_ERRORS=1
  fi
}

cd "$TRAVIS_BUILD_DIR" || exit 1
SCRIPTS=$(find ci-scripts server/scripts -name '*.sh')
for FILE in $SCRIPTS;  do
  code_review "$FILE"
done

exit $HAS_ERRORS

