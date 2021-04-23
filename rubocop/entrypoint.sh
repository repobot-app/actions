#!/bin/sh -l

git fetch origin $GITHUB_BASE_REF
git fetch origin $GITHUB_HEAD_REF

changed_files=$(ah ws cf --dir . --head-ref origin/$GITHUB_HEAD_REF --base-ref origin/$GITHUB_BASE_REF --types ruby)

if [[ -ne $changed_files ]]; then
  echo "skipping"
else
  echo "running against $changed_files"
  ah m rubocop --root $GITHUB_WORKSPACE -- --format github $changed_files
fi
