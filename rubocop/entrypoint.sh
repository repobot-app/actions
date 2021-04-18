#!/bin/sh -l

result_file="result-rubocop-$GITHUB_RUN_ID.json"

dt metrics rubocop $1 -- -o "$result_file"

echo "::set-output name=result_file::$result_file"
