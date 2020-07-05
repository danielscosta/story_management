FROM ruby:2.7.1-alpine AS build-env

ARG RAILS_ROOT=/app
ARG BUILD_PACKAGES="build-base curl-dev git"
ARG DEV_PACKAGES="mysql-dev yaml-dev zlib-dev"
ARG RUBY_PACKAGES="tzdata"

ENV RAILS_ENV=production
ENV BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"

WORKDIR $RAILS_ROOT

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES

COPY Gemfile* ./

RUN bundle config --global frozen 1 set without 'development:test:assets' \
    && bundle install -j4 --retry 3 --path=vendor/bundle \
    && rm -rf vendor/bundle/ruby/2.7.0/cache/*.gem \
    && find vendor/bundle/ruby/2.7.0/gems/ -name "*.c" -delete \
    && find vendor/bundle/ruby/2.7.0/gems/ -name "*.o" -delete

COPY . .

FROM ruby:2.7.1-alpine

ARG RAILS_ROOT=/app
ARG PACKAGES="tzdata bash mariadb-connector-c-dev yarn"

ENV RAILS_ENV=production
ENV BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"

WORKDIR $RAILS_ROOT

COPY --from=build-env $RAILS_ROOT $RAILS_ROOT

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES \
    && yarn install --check-files

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]