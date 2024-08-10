FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Atualizar RubyGems e instalar Bundler na versão correta
RUN gem update --system 3.3.22 && gem install bundler:2.4.22

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
