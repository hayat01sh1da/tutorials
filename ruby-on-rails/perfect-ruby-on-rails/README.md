## 1. Environment

- Node v23.10.0

## 2. Reference

- [『パーフェクトRuby on Rails【増補改訂版】』](https://gihyo.jp/book/2014/978-4-7741-6516-5)

## 3. Docker

### 3-1. Setup Docker

```bash
$ docker-compose build
$ docker-compose up -d
```

### 3-2. Rails

#### 3-2-1. Setup Rails Application

```bash
$ docker-compose exec app bin/setup
```

#### 3-3-2. Access `localhost:4000`

![Ruby on Rails App Home](./public/ruby-on-rails-app-home.png)

#### 3-3-2. Import Seed Data

Login via 'GitHubでログイン', and a user data will be created in `user` table.  
Then, run the following command to create sample data.

```command
docker-compose exec app bin/rails db:seed
``

## 4. `config/credentials.yml.enc`

Define a GitHub `client_id` and `client_secret`.

```yaml
# aws:
#   access_key_id: 123
#   secret_access_key: 345
secret_key_base: xxxxxxxxxxxxxxxxxxxxxxxx
github:
  client_id: [your_client_id]
  client_secret: [your_client_secret]
```
