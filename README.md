Friendship Bench Web Dashboard
==========================
The Friendship Bench project is intended to support an on-the-ground research project and intervention by providing care providers and researchers with the ability to manage enrolled patients, collect data about the intervention, and periodically assess patients for research outcome data.

Friendship Dash is a Ruby on Rails application that works in conjunction with [Friendship App](https://github.com/cbitstech/friendship_app).

## Technology Stack
- Rails 4.1.4
- Ruby 2.0.0p247
- postgresql

## Dashboard Intallation

### Clone repository

`git clone git@github.com:cbitstech/friendship_dash.git`

`cd friendship_dash`

`bundle install`

### Configure local postgres database

See development and test database info in `config/database.yml`

### Run test suite

`bin/rspec`

### Run local server

`rails s`
