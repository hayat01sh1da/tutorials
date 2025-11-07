FROM ruby:2.6.0

# Fix Debian Stretch repository URLs (Stretch is archived)
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list

# Install Packages including Node.js from Debian archive
RUN apt-get update -o Acquire::Check-Valid-Until=false && \
    apt-get install -y --allow-unauthenticated curl build-essential libpq-dev vim tree nodejs && \
    ln -s /usr/bin/nodejs /usr/bin/node

WORKDIR /tmp

# Setup Bundler (install compatible version for Ruby 2.6.0)
RUN gem install bundler -v 2.4.22

WORKDIR /app

# Unset BUNDLE_PATH to allow local configuration and force compilation
ENV BUNDLE_PATH="vendor/bundle"
ENV BUNDLE_FORCE_RUBY_PLATFORM="true"

# Bundle Install
COPY .ruby-version Gemfile Gemfile.lock ./

EXPOSE 6000
CMD ["bash"]
