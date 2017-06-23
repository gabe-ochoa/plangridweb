FROM alpine:3.6
MAINTAINER Gabe Ochoa <gabeochoa@gmail.com>

# This container runs ruby 2.4.1 as is default in the Alpine 3.6 repositories
ENV BUILD_PKS build-base ruby-dev

ENV RUN_PKS ruby ruby-bundler git bash

# Copy over files needed to install dependancies
COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/

WORKDIR /usr/app

# Update local repositories and install packages
RUN apk update &&\
  apk add $BUILD_PKS $RUN_PKS &&\
  bundle install --clean &&\
  apk del $BUILD_PKS &&\
  rm -rf /var/cache/apk/*

EXPOSE 3000

COPY . /usr/app
