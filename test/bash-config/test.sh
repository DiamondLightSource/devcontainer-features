#!/bin/bash

set -e

# Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "eternal history" bash -c "test $HISTFILE == $CONFIG_FOLDER/.bash_eternal_history"
check "execute command" bash -c "test $HISTFILE == $CONFIG_FOLDER/.bash_eternal_history"
check "ls colors" bash -c "test $LS_OPTIONS == --color=auto"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults