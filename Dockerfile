FROM ruby:2.5.7

ADD Gemfile Gemfile.lock /
RUN bundle install

WORKDIR /app

ADD . .

CMD ["bundle", "exec", "rails", "server"]
