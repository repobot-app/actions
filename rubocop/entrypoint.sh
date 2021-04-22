#!/bin/sh -l

result_file="ah-result-$GITHUB_RUN_ID.json"

ah metrics rubocop --root $GITHUB_WORKSPACE -- --format json --out $result_file $*

echo "::set-output name=result_file::$result_file"
