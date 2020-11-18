FROM ruby:2.7

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y default-mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /wordir
WORKDIR /wordir

COPY Gemfile /wordir/Gemfile
COPY Gemfile.lock /wordir/Gemfile.lock

RUN bundle install
COPY . /wordir