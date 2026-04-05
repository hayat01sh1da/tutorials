FROM ruby:4.0.2

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev default-libmysqlclient-dev vim tree

ARG BUNDLER_VERSION=4.0.9

WORKDIR /tmp

# Setup Bundler
RUN gem update --system $BUNDLER_VERSION --no-document && \
    gem install bundler -v $BUNDLER_VERSION --no-document

WORKDIR /app

# RubyGems
COPY .ruby-version Gemfile Gemfile.lock ./
ENV BUNDLE_GEMFILE=/app/Gemfile
ENV BUNDLE_PATH=/app/vendor/bundle
ENV BUNDLE_FROZEN=true
RUN bundle install

EXPOSE 6000
CMD ["bash"]
