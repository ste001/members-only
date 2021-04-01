# README

This application let the authorized members write one or more posts, while non-registered members can only see the content of those posts but not the author.

## INSTALL & RUN

First off, clone this repo locally and update the required Gems.

```
bundle install --without production
```

Verify that all the tests are green.

```
rails test
```

If they do, run the application locally.

```
rails server
```

It is usually available at ```localhost:3000``` unless you modified the path. Go to that url, and you can freely use the application locally.

It will be also shortly available on [Heroku](https://www.heroku.com).

# CREDITS

This application is part of the Ruby on Rails course on [The Odin Project](https://www.theodinproject.com/).