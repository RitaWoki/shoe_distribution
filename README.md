# Shoe_finder!

#### A web app to organize and display information about shoe stores and brands.

#### By Rita Woki

## Description

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add, update, delete, and list shoe brands.
* As a user, I want to be able to add shoe brands to a store to show where they are sold.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I do not want stores and shoes to be saved if I enter a blank name.

## Setup/Installation Requirements
*You can clone this repo

###Set up Databases:
```
$ postgres
(open new window)
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```
###Install and Run Bundler:
```
$ gem install bundler
$ bundle
```
###Run the Sinatra application:
```
$ ruby app.rb
Navigate to `localhost:4567` with a browser
```

## Technologies Used

* Ruby
* Sinatra
* PostgreSQL
* Active Record
* HTML
* CSS
* Bootstrap

### License

Copyright (c) 2017  **Rita Woki**
