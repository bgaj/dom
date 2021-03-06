FROM starefossen/ruby-node
MAINTAINER bartosz.gaj@eengine.pl

RUN apt-get update && apt-get install -y \
build-essential \
nodejs \
imagemagick \
cron \
optipng \
libjpeg-progs \
ffmpeg
RUN apt-get -y remove exim4 exim4-base exim4-config exim4-daemon-light

WORKDIR /gospodarstwo

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

ENV BUNDLE_PATH=/bundle \
   BUNDLE_BIN=/bundle/bin \
   GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
