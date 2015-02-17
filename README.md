# EsHero

Elasticsearch insights made easy

[View the demo](https://eshero.herokuapp.com/)

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'eshero'
```

And mount the dashboard in your `config/routes.rb`:

```ruby
mount EsHero::Engine, at: "eshero"
```

Be sure to [secure the dashboard](#security) in production.

## Insights

```ruby
EsHero.indices
EsHero.nodes
```

## Security

#### Basic Authentication

Set the following variables in your environment or an initializer.

```ruby
ENV["ESHERO_USERNAME"] = "andrew"
ENV["ESHERO_PASSWORD"] = "secret"
```

#### Devise

```ruby
authenticate :user, lambda {|user| user.admin? } do
  mount EsHero::Engine, at: "eshero"
end
```

## TODO

- status checks
- stats on memory and disk space

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/eshero/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/eshero/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
