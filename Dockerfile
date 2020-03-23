FROM ruby:2.6.5
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vim build-essential postgresql-client

# Install nodejs and yarn
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn

RUN mkdir /seeds-house
WORKDIR /seeds-house

COPY Gemfile /seeds-house/Gemfile
COPY Gemfile.lock /seeds-house/Gemfile.lock

RUN bundle install
COPY . /seeds-house