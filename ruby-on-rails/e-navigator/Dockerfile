FROM ruby:3.4.7

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev vim tree

# Install Node.js and Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install Yarn
RUN npm install -g yarn

WORKDIR /tmp

# Setup Bundler
RUN gem install bundler && gem update --system

WORKDIR /app

# Bundle Install
COPY .ruby-version Gemfile Gemfile.lock ./
RUN bundle config set path vendor/bundle
RUN bundle config set force_ruby_platform true
RUN bundle install

# Copy package.json and install JavaScript dependencies
COPY package.json package-lock.json* yarn.lock* ./
RUN yarn install --frozen-lockfile || yarn install

# Copy application code
COPY . .

EXPOSE 6000
CMD ["bash"]
