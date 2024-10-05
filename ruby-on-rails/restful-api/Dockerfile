FROM ruby:3.3.5

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev vim tree

WORKDIR /tmp

# Setup Bundler
RUN gem install bundler && gem update --system

WORKDIR /app

# Bundle Install
COPY .ruby-version Gemfile Gemfile.lock ./
RUN bundle config set path vendor/bundle
RUN bundle install

# Remove the Remaining Process Files
RUN rm -rf tmp/pids/server.pid

CMD ["./bin/rails", "s", "-b", "0.0.0.0", "-p", "5000"]
