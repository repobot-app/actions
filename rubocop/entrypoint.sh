#!/bin/sh -l

result_file="result-rubocop-$GITHUB_RUN_ID.json"

echo "::debug::rubocop start"
ah metrics rubocop -- -o "$result_file" $1
grep '::debug::' /usr/local/src/cli/log/cli.log
echo "::debug::rubocop stop"
echo "::set-output name=result_file::$result_file"
