#!/bin/sh -l

git fetch

if [[ $GITHUB_EVENT_NAME == "pull_request" ]]; then
  changed_files=$(ah ws cf --range "origin/$GITHUB_BASE_REF...origin/$GITHUB_HEAD_REF" --types ruby)
else
  changed_files=$(ah ws cf --range "$GITHUB_SHA~1" --types ruby)
fi

echo "::group::Changed/Added files"
echo "FILES<<STR"
echo "$changed_files"
echo "STR"
echo "::endgroup::"

if [[ -z "$changed_files" ]]; then
  echo "No changes found, skipping checks"
else
  echo "::group::Results"
  ah m rubocop --root $GITHUB_WORKSPACE -- --format github $changed_files
  echo "::endgroup::"
fi
