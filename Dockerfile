FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client libmysqlclient-dev


RUN mkdir /schedulr

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /schedulr
WORKDIR /schedulr
#RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
#RUN RAILS_ENV=production bundle exec rake db:create
#RUN RAILS_ENV=production bundle exec rake db:migrate
#RUN RAILS_ENV=development web bundle exec rake db:create
#RUN RAILS_ENV=development web bundle exec rake db:migrate
CMD ["rails","server","-b","0.0.0.0"]