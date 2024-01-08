# ruby_ares

Gem for accesing business information from ARES database. This gem is based on [ruby-ares](https://github.com/strzibny/ruby-ares) .

This gem is not implementing whole ARES API, only the part that allow to get information about company. If you need more functionality, feel free to contribute or use an [API directly]().

## Installation

Add this line to your application's Gemfile:

```ruby
gem "ruby_ares", "~> 0.1.0", github: "railsformers/ruby_ares"
```

## Usage

To get ARES information about a company, use the `Ares` class:

```ruby
  subject = RubyAres::Subject.get("24704440")
```

The `subject` object will contain all the information about the company. Check ARES docs for object structure: [DOCS](https://ares.gov.cz/swagger-ui/#/ekonomicke-subjekty/vratEkonomickySubjekt)

Return data is default type of `OpenStruct`. If you prefer `Hash` type, you can use
```ruby
  subject = RubyAres::Subject.get("24704440", Hash)
```

### Exceptions

In case of an error, the `Ares` class will raise an `RubyAres::Error` exception. The exception will contain the error message from ARES, response status, type and response.

```ruby
  begin
    subject = RubyAres::Subject.get("non-existing")
  rescue RubyAres::Error => e
    puts e.status
    puts e.type
    puts e.response
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_ares.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
