FROM node:23.11.0 AS node
FROM ruby:3.4.5

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
RUN gem install bundler && gem update --system

WORKDIR /app

# Yarn Install
COPY package.json yarn.lock ./
RUN npm install -g yarn
RUN yarn install

# Bundle Install
COPY .ruby-version Gemfile Gemfile.lock ./
RUN bundle config set path vendor/bundle
RUN bundle config set force_ruby_platform true

EXPOSE 4000
CMD ["bash"]
