FROM ruby:3.4.7

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev vim tree

WORKDIR /tmp

# Setup Bundler
RUN gem install bundler -v 4.0.1

WORKDIR /app

# RubyGems
COPY .ruby-version Gemfile Gemfile.lock ./
ENV BUNDLE_GEMFILE=/app/Gemfile
ENV BUNDLE_PATH=/app/vendor/bundle
ENV BUNDLE_FROZEN=true
ENV BUNDLE_WITHOUT="development:test"
RUN bundle install

EXPOSE 5000
CMD ["bash"]
