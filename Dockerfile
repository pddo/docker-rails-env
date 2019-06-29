FROM ruby:2.6.3
MAINTAINER dduyphuc@gmail.com

RUN apt-get update \
  && apt-get install -y \
     build-essential \
     nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /work
WORKDIR /work

# Add latest gems which required for new Rails app
COPY Gemfile ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

