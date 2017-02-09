# Schedulr

## Description

View available listings from service Providers, and book them for one of the available time-blocks that they've listed. 

## Design decisions

### Providers
* Providers are prevented from viewing all other listings except their own. They can of course create a separate client account, however.
* Minimum booking timeblock is 1 hour. No maximum.
* Cannot create two listings that overlap, i.e no double-booking.
* Can cancel a booking; it will become available once again.
* Can see their own listings whose start_at time is in the past. It will be highlighted as such.

### Clients
* Cannot see available listings whose times overlap with current bookings.
* Cannot see available listings whose start_at is in the past.
* Can cancel a booking.


## v2.0 Todo in order of priority

* Auto-polling to refresh changes to the available listings has been implemented but disabled, because its crummy. Other possibilities
for live updating include ActionCable, a library for Rails built on websockets+Redis or maybe data-binding via react.
* Have the ability to book multiple time-slots in a single day. Add a has_many :time_blocks resource to Listing, and move the :start_at and :end_at properties into that. 
* Implement specs.
* Wire up actionmailer for booking notifications.
* Add a nice 404 page
* Add more properties and details to the listing: price, location, description, pictures etc...
* Add search and filters for the above details.
* As an improvement to the current 'Available' flag, add statefulness to the Listing through another model or state-machine. 'Requested', 'Confirmed', 'Booked' can be such states. 'Requested' can transition to 'Confirmed', for example. This will allow more flexibility if a provider wants to modify a listing without canceling it. In this case it might go back to 'Requested'.

## Deployment & configuration

### Prerequisites

`docker-engine >=1.13`
`docker-compose >=1.1.0`

Docker environment variables are referenced in `.env.web` and `.env.db`. Don't forget to drop in a `config/database.yml` too.

From within your host `git clone git@github.com:rpavlov/schedulr.git`, 
`cd schedulr/`, `docker-compose build` and finally `docker-compose up`.

Hit `0.0.0.0:3000/register`

## Testing

`docker-compose run -e RAILS_ENV=test web rake rspec spec`
