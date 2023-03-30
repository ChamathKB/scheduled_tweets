# Scheduled Tweets

[![Build Status](https://app.travis-ci.com/ChamathKB/scheduled_tweets.svg?branch=main)](https://app.travis-ci.com/ChamathKB/scheduled_tweets)

Ruby on rails app to schedul tweets.

## Main Components
 - Ruby on rails 
 - js, html, css with Bootstrap
 - Sidekiq
 - Sqlite
 - postgresql
 - redis
 - Twitter API 

Ruby version - 2.7.0

## Setup
```
git clone https://github.com/ChamathKB/scheduled_tweets.git

cd scheduled_tweets
```

## Install dependencies
```
bundle install
```

## Database migrations
```
rails db:create && rails db:migrate
```

## Run app - development mode
```
rails start
```
opens in http://localhost:3000/ 
