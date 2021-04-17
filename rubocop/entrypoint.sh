#!/bin/sh -l

export PATH="/usr/local/bundle/bin:$PATH"

rubocop lib/

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
