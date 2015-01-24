hair-salon
==========

A web app that organizes a hair salon. You can associate stylists to clients in a one-to-many relationship. Written in [Ruby](http://www.ruby-lang.org/) with the help of [RSpec](http://rspec.info/), [Sinatra](http://www.sinatrarb.com/), and [Bootstrap](http://http://getbootstrap.com/). The data is stored in a PostgreSQL backend.

Usage
-----

To set up the database run these commands inside of psql:

```
CREATE DATABASE hair_salon;
\c hair_salon
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```

Run [Bundler](http://bundler.io/) from the project directory to install all the gems word-frequency depends on:

```ruby
bundle -install
```

Start the Sinatra server:

```ruby
ruby app.rb
```

In your browser, navigate to [http://localhost:4567/](http://localhost:4567/).

About
-----

Written by Clem Freeman [Epicodus](http://www.epicodus.com/).

License
-------

This projected is licensed under the terms of the MIT license.