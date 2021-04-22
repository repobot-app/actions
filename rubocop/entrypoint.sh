#!/bin/sh -l

result_file="/tmp/ah-result-$GITHUB_RUN_ID.json"

echo $(pwd)

ah metrics rubocop --root $GITHUB_WORKSPACE -- --format json --out $result_file $*

echo $(cat "/var/log/ah-cli.log")

echo $(cat $result_file)

echo "::set-output name=result_file::$result_file"
