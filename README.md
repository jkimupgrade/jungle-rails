# Jungle

A mini e-commerce application built with `Rails 4.2` and tested with `RSpec`.

## Features
- Add items to cart and checkout with __Stripe API__
- Display a red 'Sold Out!' marker when product quantity is zero
- Display active sale on every page (e.g. Black Friday)
- Admin access control with __http_basic_authenticate_with__
- Admin dashboard with counts of categories and products in database
- Admin can create new categories and products
- Admin can create new sales

## Screenshot
!["main page"](/docs/main-page.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
