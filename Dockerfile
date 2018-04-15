FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y --no-install-recommends apt-utils build-essential libpq-dev nodejs libicu-dev cmake mysql-client
RUN mkdir -p /export/lodge/config
WORKDIR /export/lodge/
ADD Gemfile /export/lodge/Gemfile
ADD Gemfile.lock /export/lodge/Gemfile.lock
ADD Rakefile /export/lodge/Rakefile
ADD config/database.yml /export/lodge/config/database.yml
ADD config/application.rb /export/lodge/config/application.rb
RUN bundle install
ENV PATH $PATH:/usr/local/bundle/bin/
