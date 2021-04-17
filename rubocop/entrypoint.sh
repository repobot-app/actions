#!/bin/sh -l

export PATH="/usr/local/bundle/bin:$PATH"

rubocop $1
