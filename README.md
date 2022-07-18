# TWire

TWire is a social network built in rails, used as an example of Hotwire and its sorrounding technologies

## Required software

- Postgresql 9.4+ (14 recommended)
- Redis
- Ruby 3.0.3
  - It's suggested to install it using rbenv or rvm as version managers. Their official guides should be able to help you (see https://rvm.io/ or https://github.com/rbenv/rbenv)

## Installation

```bash
bundle install
rails db:create db:migrate
```

## Usage

```bash
rails server
```


## Specs & linter

```bash
bundle exec rubocop # -A if you want to use autosolve
bundle exec rspec
```

## Deployment

## License