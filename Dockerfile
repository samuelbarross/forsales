FROM ruby:2.6.6-alpine

RUN apk add --update --no-cache \
    bash \
    build-base \
    nodejs \
    npm \
    postgresql-dev \
    yarn \
    tzdata \
    imagemagick6 \
    imagemagick6-c++ \
    imagemagick6-dev \
    imagemagick6-libs \
    less \
    ttf-ubuntu-font-family \
    wkhtmltopdf

ENV BUNDLER_VERSION 2.0.2
ENV APP_HOME /app/forsales
RUN mkdir -p $APP_HOME
RUN gem install bundler -v $BUNDLER_VERSION
WORKDIR $APP_HOME
COPY . ./
RUN bundle check || bundle install

