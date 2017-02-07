# Schedulr

## Description

View available timeslots for a <skilled_service_person>, and book them for a <skilled_service>. 

## Todo

* Wire up actionmailer
* Add limit to bookings.
* Add recurring bookings.

## Prerequisites

`docker-engine >=1.13`
`docker-compose >=1.1.0`

## Deployment & configuration

Docker environment variables are referenced in `.env.web` and `.env.db`. Don't forget to drop in a `config/database.yml` too.

From within your host `git clone git@github.com:rpavlov/schedulr.git`, 
`cd schedulr/`, `docker-compose build` and finally `docker-compose up`.

Hit `0.0.0.0:3000`

##Testing

`docker-compose run -e RAILS_ENV=test web rake rspec spec`
