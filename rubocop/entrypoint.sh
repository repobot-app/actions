#!/bin/sh -l

if [[ $GITHUB_EVENT_NAME == "pull_request" ]];then
  git fetch origin $GITHUB_BASE_REF
  git fetch origin $GITHUB_HEAD_REF

  changed_files=$(ah ws cf --range "origin/$GITHUB_BASE_REF...origin/$GITHUB_HEAD_REF" --types ruby)
else
  changed_files=$(ah ws cf --range "$GITHUB_SHA~1" --types ruby)
fi

if [[ ! -z "$changed_files" ]]; then
  echo "No changes found, skipping checks"
else
  echo "::group::{Changed/Added files}"
  echo "Running against $changed_files"
  echo "::endgroup::"

  echo "::group::{Results}"
  ah m rubocop --root $GITHUB_WORKSPACE -- --format github $changed_files
  echo "::endgroup::"
fi
