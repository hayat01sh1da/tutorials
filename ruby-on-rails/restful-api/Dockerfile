FROM ruby:4.0.1

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev vim tree

WORKDIR /tmp

# Setup Bundler
RUN gem update --system 4.0.4
RUN gem install bundler -v 4.0.4

WORKDIR /app

# RubyGems
COPY .ruby-version Gemfile Gemfile.lock ./
ENV BUNDLE_GEMFILE=/app/Gemfile
ENV BUNDLE_PATH=/app/vendor/bundle
ENV BUNDLE_FROZEN=true
RUN bundle install

EXPOSE 5000
CMD ["bash"]
