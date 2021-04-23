#!/bin/sh -l

echo "::group::Changed/Added files"
echo "$GIT_DIFF"
echo "::endgroup::"

case $1 in
  Style)
    ah m rubocop -- --format github $GIT_DIFF -- --only-guide-cops --only-recognized-file-types
  ;;
  Lint)
    ah m rubocop -- --format github $GIT_DIFF -- -l --only-recognized-file-types
  ;;
  *)
    ah m rubocop -- --format github $GIT_DIFF --only-recognized-file-types
  ;;
esac
