# Railstarter

This Rails app contains a highly biased setup which follows my typical steps when starting a new app for prototyping. It works with Postgres as a database, sorcery for authentication and HAML instead of ERB view templates.

The whole app can be deployed to Heroku super fast. Most of the reasoning behind this whole setup is that if I have another weird app idea, I don't wanna spend writing boilerplate for a long time (even if it's just 1-2 hours). I just wanna start working on business logic and see results fast.

## Things you need

- Ruby & Rails installed (version information follows)
- Local installation of PostgreSQL (version information follows)
- Heroku CLI

## Setup

To install the app:

```bash
bundle
```

To setup PostgreSQL

```bash
bundle exec db:create
bundle exec db:migrate
```

## Useful commands

Start the app

```bash
bundle exec rails server
```
