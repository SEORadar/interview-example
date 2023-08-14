
# SEO Radar Interview Example

<img width="1311" alt="image" src="https://github.com/SEORadar/interview-example/assets/37591/1b57442b-ceea-4e1d-9323-6023682fcc96">

## Overview

This is a basic Ruby on Rails app that runs within docker-compose, similar
to our real working environment.

## Instructions for this Exercise

Please use the following workflow:

* clone this repository
* checkout a new branch for your work
* Complete the tasks
* make git commits to record your progress
* push your branch and open a pull request

## BEFORE YOU BEGIN

* Make sure you run the following commands in your rails project:

```bash
bundle install
bin/rails db:create db:migrate db:seed
```

To start the rails application so you can visit it in your web browser at http://localhost:3000 run the following command:

```bash
bin/dev
```

### Task 1: Display User Info on Member Dashboard

Currently, after signing in, the User will see a "dashboard" screen. Update that dashboard so it shows their email, created at, and updated at instead of "...".

### Task 2: Store and Display All Login Timestamps

Currently, the member dashboard only shows the time of their most recent login. Make the necessary changes to the database, models, controllers, and views so we can store and display when every login happens for a user.

### Task 3: Product Detail Page + Categories

* Display a list of all the categories each product belongs to, and link to them.

### Task 4: "Favorite" a Product

* If the current user is signed in, show a heart icon which the user can click to "heart" the product, and click again to remove the product from their favorites.
* On the "Members Dashboard" view, add a list of links to their favorite products.

### Task 5: Only show "is_active=true" Products

* On the Category page, only show "active" products.
* If a product with "is_active=false" is requested, return a 404 response.
* Remove "is_active=false" products from the Members Dashboard "favorite products" list.

## What is this?

This is very simple web application.

* Ruby on Rails
* SQLite
* TailwindCSS

This application has only a single working feature: a user may sign in and sign out.

* username: `user@example.com`
* password: `password123`

## How to use

```bash
git clone git@seoradar:interview-example.git
cd interview-example/
./setup-workstation
docker-compose up
```

The world is yours.
