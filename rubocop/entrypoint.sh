#!/bin/sh -l

echo "::group::Changed/Added files"
echo "$MATCHED_FILES"
echo "$GIT_DIFF"
echo "::endgroup::"

case $1 in
  Style)
    ah m rubocop -- --format github $MATCHED_FILES -- --only-guide-cops
  ;;
  Lint)
    ah m rubocop -- --format github $MATCHED_FILES -- -l
  ;;
  *)
    ah m rubocop -- --format github $MATCHED_FILES
  ;;
esac
