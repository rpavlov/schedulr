# Schedulr

## Description

View available listings from service Providers, and book them for one of the available time-blocks that they've listed. 

## Design decisions

* Providers are prevented from viewing all other listings except their own. They can of course create a separate client account, however.
* Minimum booking timeblock is 1 hour. No maximum.

## v2.0 Todo in order of priority

* Have the ability to book multiple time-slots in a single day.
* Wire up actionmailer for booking notifications.
* Add a nice 404 page
* Implement a better auto-refresh mechanism than the current javascript interval polling.
* Have the ability for providers to confirm or deny a booking request. Requested bookings are taken out of the available listings.

## Prerequisites

`docker-engine >=1.13`
`docker-compose >=1.1.0`

## Deployment & configuration

Docker environment variables are referenced in `.env.web` and `.env.db`. Don't forget to drop in a `config/database.yml` too.

From within your host `git clone git@github.com:rpavlov/schedulr.git`, 
`cd schedulr/`, `docker-compose build` and finally `docker-compose up`.

Hit `0.0.0.0:3000/register`

## Testing

`docker-compose run -e RAILS_ENV=test web rake rspec spec`
