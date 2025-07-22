FROM ruby:3.4.5

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev vim tree

WORKDIR /tmp

# Setup Bundler
RUN gem install bundler && gem update --system

WORKDIR /app

# Bundle Install
COPY .ruby-version Gemfile Gemfile.lock ./
RUN bundle config set path vendor/bundle
RUN bundle config set force_ruby_platform true

EXPOSE 5000
CMD ["bash"]
