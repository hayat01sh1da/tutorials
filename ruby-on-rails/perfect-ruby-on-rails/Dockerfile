FROM node:22.9.0 AS node
FROM ruby:3.3.5

# Install Packages
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update && apt-get install -y curl build-essential libpq-dev libvips libvips-dev vim tree google-chrome-stable

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
RUN bundle install

# Remove the Remaining Process Files
RUN rm -rf tmp/pids/server.pid

CMD ["./bin/rails", "s", "-b", "0.0.0.0", "-p", "4000"]
