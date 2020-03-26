FROM ruby:2.3
MAINTAINER bartosz.gaj@eengnie.pl

#ENV RAILS_ENV production
#ENV RACK_ENV production


RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

RUN apt-get update && apt-get install -y \
build-essential \
nodejs \
imagemagick \
cron \
optipng \
libjpeg-progs

WORKDIR /gospodarstwo

