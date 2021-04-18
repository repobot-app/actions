#!/bin/sh -l

result_file="result-rubocop-$GITHUB_RUN_ID.json"

echo "::debug::rubocop start"
dt metrics rubocop --root $GITHUB_WORKSPACE $1 -- -o "$result_file"
grep '::debug::' /cli/log/cli.log
echo "::debug::rubocop stop"
echo "::set-output name=result_file::$result_file"
