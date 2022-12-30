#!/bin/sh -l

echo "::group::Changed/Added files"
echo "$2"
echo "::endgroup::"

if [[ $1 != "" ]]; then
  repobot m rubocop -- --format github --only $1 --only-recognized-file-types $2
else
  repobot m rubocop -- --format github --only-recognized-file-types $2
fi
