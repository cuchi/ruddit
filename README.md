# Ruddit

> ⚠️🚧 **Work in progress!** Check out the [Roadmap](#Roadmap) ⚠️🚧

## How to run it

Make sure you have:

- [Ruby](https://www.ruby-lang.org/) `3.0.3`
- [Node.js](https://nodejs.org/en/) `16.x`
- [Docker](https://get.docker.com/) with `docker-compose`, ([Podman](https://podman.io/) also works)

Run:

```bash
bin/bundle install
docker-compose up -d
bin/rails db:setup
bin/rails s
```

Here we go! It should be up and running at http://localhost:3000

## Roadmap

- [x] Project setup:
  - [x] Rails
  - [x] React
  - [x] PostgreSQL
  - [x] GraphQL
  - [x] Linting (Rubocop)
  - [x] CI (GitHub actions)
  - [ ] CD (Heroku?)
- [ ] Implement features for:
  - [ ] Posts listing
    - [x] Backend
    - [ ] Frontend
    - [x] Tests
  - [ ] Posts creation
    - [x] Backend
    - [ ] Frontend
    - [ ] Tests
  - [ ] User creation
    - [x] Backend
    - [ ] Frontend
    - [ ] Tests
  - [ ] User authentication
    - [x] Backend
    - [ ] Frontend
    - [x] Tests
  - [ ] Comments listing
    - [x] Backend
    - [ ] Frontend
    - [ ] Tests
  - [x] Comments creation
    - [x] Backend
    - [ ] Frontend
    - [x] Tests
  - [ ] Voting
    - [ ] Backend
    - [ ] Frontend
    - [ ] Tests
- [ ] Improvements
  - [ ] Improve GraphQL queries (specially recursive ones) to solve the good old N+1 problem
        and leverage some batching. The Dataloader feature may help with this
  - [ ] Use _Relay-style_ pagination
