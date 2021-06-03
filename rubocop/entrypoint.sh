#!/bin/sh -l

echo "::group::Changed/Added files"
echo "$GIT_DIFF"
echo "::endgroup::"

if [[ $1 != "" ]]; then
  ah m rubocop -- --format github --only $1 --only-recognized-file-types $GIT_DIFF
else
  ah m rubocop -- --format github --only-recognized-file-types $GIT_DIFF
fi
