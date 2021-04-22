#!/bin/sh -l

result_file="/tmp/ah-result-$GITHUB_RUN_ID.json"

ls -l

echo $*

echo "::debug::rubocop start"
ah metrics rubocop -- --format json --out $result_file $*
grep '::debug::' /usr/local/src/cli/log/cli.log
echo "::debug::rubocop stop"
echo "::set-output name=result_file::$result_file"
