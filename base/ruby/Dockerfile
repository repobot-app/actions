ARG ruby_version=3.0

FROM ruby:$ruby_version-alpine

RUN apk update && apk add git libgit2-dev cmake build-base

COPY files /

RUN bundle config set without 'development test benchmarks tools'
