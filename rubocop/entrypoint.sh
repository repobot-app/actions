#!/bin/sh -l

if [[ $GITHUB_EVENT_NAME == "pull_request" ]]; then
  changed_files=$(ah ws cf --range "origin/$GITHUB_BASE_REF...origin/$GITHUB_HEAD_REF" --types ruby)
else
  changed_files=$(ah ws cf --range "origin/$GITHUB_REF" --types ruby)
fi

echo "::group::Changed/Added files"
echo "$changed_files"
echo "::endgroup::"

if [[ -z "$changed_files" ]]; then
  echo "No changes found, skipping checks"
else
  case $1 in
    Style)
      ah m rubocop -- --format github $changed_files -- --only-guide-cops
    ;;
    Lint)
      ah m rubocop -- --format github $changed_files -- -l
    ;;
    *)
      ah m rubocop -- --format github $changed_files
    ;;
  esac
fi
