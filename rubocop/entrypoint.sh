#!/bin/sh -l

result_file="/tmp/ah-result-$GITHUB_RUN_ID.json"

ah metrics rubocop -- --format json --out $result_file $*

echo $(cat "/var/log/ah-cli.log")

echo "::set-output name=result_file::$result_file"
