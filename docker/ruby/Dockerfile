FROM ruby:2.6.3-alpine3.10

RUN apk update && apk add build-base postgresql-client postgresql-dev
RUN mkdir /app && mkdir /var/run/app && mkdir /var/log/app

COPY ./ /app
WORKDIR /app

RUN bundle install

# Start the main process.
CMD puma -C pumaconf.rb
