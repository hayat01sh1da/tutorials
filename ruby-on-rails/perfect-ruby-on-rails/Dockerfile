FROM node:25.8.2 AS node
FROM ruby:4.0.2

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev vim tree chromium

# Setup Node.js
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/include/node /usr/local/include/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm
RUN npm install -g pnpm@10.33.0

ARG BUNDLER_VERSION=4.0.9

WORKDIR /tmp

# Setup Bundler
RUN gem update --system $BUNDLER_VERSION --no-document && \
    gem install bundler -v $BUNDLER_VERSION --no-document

WORKDIR /app

# pnpm Install
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# RubyGems
COPY .ruby-version Gemfile Gemfile.lock ./
ENV BUNDLE_GEMFILE=/app/Gemfile
ENV BUNDLE_PATH=/app/vendor/bundle
ENV BUNDLE_FROZEN=true
RUN bundle install

EXPOSE 4000
CMD ["bash"]
