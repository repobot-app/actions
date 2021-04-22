#!/bin/sh -l

result_file="ah-result-$GITHUB_RUN_ID.json"

git fetch origin $GITHUB_BASE_REF
git fetch origin $GITHUB_HEAD_REF

changed_files=$(ah ws cf --dir . --head-ref origin/$GITHUB_HEAD_REF --base-ref origin/$GITHUB_BASE_REF --types ruby)

if [[ -ne $changed_files ]]; then
  echo "skipping"
else
  echo "running against $changed_files"
  ah m rubocop --root $GITHUB_WORKSPACE -- --format json --out $result_file $changed_files
fi

echo $(cat /var/log/ah-cli.log)

echo "::set-output name=result_file::$result_file"
