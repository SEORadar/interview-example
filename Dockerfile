
FROM ruby:3.2.2

RUN apt-get update && apt-get install -y psutils npm

COPY ./ /opt/app

WORKDIR /opt/app

RUN bundle install

ENTRYPOINT ./docker-entrypoint.sh
