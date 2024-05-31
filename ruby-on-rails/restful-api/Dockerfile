FROM ruby:3.3.2

# Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev vim tree

WORKDIR /tmp

# Bundler
RUN gem install bundler && gem update --system

WORKDIR /app

# RubyGems
RUN bundle config set path vendor/bundle

EXPOSE 3000
CMD ["bash"]
