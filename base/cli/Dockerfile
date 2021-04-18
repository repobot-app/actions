ARG ruby_version=latest
ARG cli_version=main

FROM docker.pkg.github.com/solnic/dt-actions/ruby:$ruby_version

COPY files /

RUN git clone https://github.com/solnic/dt-cli.git cli && \
  cd cli && git checkout $cli_version && bundle
