FROM node:25.1.0 AS node
FROM ruby:3.4.7

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev vim tree chromium

# Setup Node.js
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/include/node /usr/local/include/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

WORKDIR /tmp

# Setup Bundler
RUN gem install bundler -v 4.0.1

WORKDIR /app

# Yarn Install
COPY package.json yarn.lock ./
RUN npm install -g yarn
RUN yarn install

# RubyGems
COPY .ruby-version Gemfile Gemfile.lock ./
ENV BUNDLE_GEMFILE=/app/Gemfile
ENV BUNDLE_PATH=/app/vendor/bundle
ENV BUNDLE_FROZEN=true
RUN bundle install

EXPOSE 4000
CMD ["bash"]
