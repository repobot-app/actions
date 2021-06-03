#!/bin/sh -l

echo "::group::Changed/Added files"
echo "$GIT_DIFF"
echo "::endgroup::"

case $1 in
  Style)
    ah m rubocop -- --format github $GIT_DIFF -- --only Style --only-recognized-file-types
  ;;
  Naming)
    ah m rubocop -- --format github $GIT_DIFF -- --only Naming --only-recognized-file-types
  ;;
  Lint)
    ah m rubocop -- --format github $GIT_DIFF -- --only Lint --only-recognized-file-types
  ;;
  Layout)
    ah m rubocop -- --format github $GIT_DIFF -- --only Layout --only-recognized-file-types
  ;;
  Metrics)
    ah m rubocop -- --format github $GIT_DIFF -- --only Metrics --only-recognized-file-types
  ;;
  Security)
    ah m rubocop -- --format github $GIT_DIFF -- --only Security --only-recognized-file-types
  ;;
  *)
    ah m rubocop -- --format github $GIT_DIFF -- --only-recognized-file-types
  ;;
esac
