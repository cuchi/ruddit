# Ruddit

> ⚠️🚧 **Work in progress!** ⚠️🚧

## How to run it

Make sure you have:
- [Ruby](https://www.ruby-lang.org/) `3.0.3`
- [Node.js](https://nodejs.org/en/) `16.x`
- [Docker](https://get.docker.com/) with `docker-compose`, or [Podman](https://podman.io/) also works

Run:
```bash
bin/bundle install
docker-compose up -d
bin/rails db:setup
bin/rails s
```

Here we go! It should be up and running at http://localhost:3000
