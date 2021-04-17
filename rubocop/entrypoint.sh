#!/bin/sh -l

export PATH="/usr/local/bundle/bin:$PATH"

result_file="result-rubocop-$GITHUB_RUN_ID.json"

rubocop --format json -o "$result_file" $1

echo "::set-output name=result_file::$result_file"
