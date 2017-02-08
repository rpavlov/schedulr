# Schedulr

## Description

View available timeslots for a service Provider, and book them for one of the available time-blocks that they've listed. 

## Design decisions

* Providers are prevented from viewing all other listings except their own. They can of course create a separate client account, however.

## Todo

* Wire up actionmailer for booking notifications.

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
