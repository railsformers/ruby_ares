# ruby_ares

Gem for accesing business information from ARES database. This gem is based on [ruby-ares](https://github.com/strzibny/ruby-ares) .

This gem is not implementing whole ARES API, only the part that allow to get information about company. If you need more functionality, feel free to contribute or use an [API directly](https://ares.gov.cz/stranky/vyvojar-info).

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

```ruby
{
  "ico"=>"24704440",
  "obchodniJmeno"=>"Railsformers s.r.o.",
  "sidlo"=>
   {"kodStatu"=>"CZ",
    "nazevStatu"=>"Česká republika",
    "kodKraje"=>132,
    "nazevKraje"=>"Moravskoslezský kraj",
    "kodOkresu"=>3807,
    "nazevOkresu"=>"Ostrava-město",
    "kodObce"=>554821,
    "nazevObce"=>"Ostrava",
    "kodMestskeCastiObvodu"=>546224,
    "kodUlice"=>367664,
    "nazevMestskeCastiObvodu"=>"Poruba",
    "nazevUlice"=>"Vřesinská",
    "cisloDomovni"=>2371,
    "kodCastiObce"=>414085,
    "cisloOrientacni"=>33,
    "nazevCastiObce"=>"Poruba",
    "kodAdresnihoMista"=>73387169,
    "psc"=>70800,
    "textovaAdresa"=>"Vřesinská 2371/33, Poruba, 70800 Ostrava"},
  "pravniForma"=>"112",
  "datumVzniku"=>"2010-06-30",
  "datumAktualizace"=>"2023-12-06",
  "dic"=>"CZ24704440",
  "icoId"=>"24704440",
  "adresaDorucovaci"=>{},
  "seznamRegistraci"=>
   {"stavZdrojeVr"=>"AKTIVNI",
    "stavZdrojeRes"=>"AKTIVNI",
    "stavZdrojeRzp"=>"AKTIVNI",
    "stavZdrojeNrpzs"=>"NEEXISTUJICI",
    "stavZdrojeRpsh"=>"NEEXISTUJICI",
    "stavZdrojeRcns"=>"NEEXISTUJICI",
    "stavZdrojeSzr"=>"NEEXISTUJICI",
    "stavZdrojeDph"=>"AKTIVNI",
    "stavZdrojeSd"=>"NEEXISTUJICI",
    "stavZdrojeIr"=>"NEEXISTUJICI",
    "stavZdrojeCeu"=>"NEEXISTUJICI",
    "stavZdrojeRs"=>"NEEXISTUJICI",
    "stavZdrojeRed"=>"NEEXISTUJICI"},
  "primarniZdroj"=>"vr",
  "czNace"=>["00", "6820"],
  "dicSkDph"=>"N/A"
 }
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

## Migrate from ruby-ares

* rename `RubyARES` to `RubyAres`
* rename `RubyARES::Parser::ARESDatabaseError` and `RubyARES::Parser::ParseError` to `RubyAres::Error`
* adjust `subject.attribute` calls to new structure


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_ares.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
