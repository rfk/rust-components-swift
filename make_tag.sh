#!/usr/bin/env bash
#
# Make a new tag for this package.

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

"$THIS_DIR/generate.sh"
git add "$THIS_DIR/generated"
git commit -a --amend
git tag -f 0.3.0
