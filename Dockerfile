FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client libmysqlclient-dev

RUN mkdir /schedulr

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /schedulr
WORKDIR /schedulr
CMD ["rails","server","-b","0.0.0.0"]