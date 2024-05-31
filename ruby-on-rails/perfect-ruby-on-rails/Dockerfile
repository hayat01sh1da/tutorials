FROM node:21.3.0 AS node
FROM ruby:3.3.2

# Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev libvips libvips-dev vim tree
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update && apt-get install -y google-chrome-stable

# Node.js
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/include/node /usr/local/include/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

WORKDIR /tmp

# Bundler
RUN gem install bundler && gem update --system

WORKDIR /app

# NPM packages
COPY package.json /app/
RUN npm install -g yarn

# RubyGems
RUN bundle config set path vendor/bundle

EXPOSE 3000
CMD ["bash"]
