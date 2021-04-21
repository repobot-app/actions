ARG ruby_version=latest
ARG cli_version=main

FROM solnic/ah-ruby:$ruby_version

COPY files /

RUN git clone https://github.com/solnic/ah-cli.git cli && \
  cd cli && git checkout $cli_version && bundle
