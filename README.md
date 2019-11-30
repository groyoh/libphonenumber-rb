# Libphonenumber

[![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/badges/stability-badges)[![Build Status](https://travis-ci.org/groyoh/libphonenumber-rb.svg?branch=master)](https://travis-ci.org/groyoh/libphonenumber-rb)[![Coverage Status](https://coveralls.io/repos/github/groyoh/libphonenumber-rb/badge.svg?branch=master)](https://coveralls.io/github/groyoh/libphonenumber-rb?branch=master)

This gem is an experiment to use [Go libphonenumber](https://github.com/ttacon/libphonenumber) library in Ruby via C-extensions.

It will compile the go file in `ext/libphonenumber/` into a standard shared
object binary file (.so) exposing Go functions as C-style APIs. The gem will
then rely on FFI to work with the API from the shared object.

This experiment was created to try and solve one specific problem: validation
and formatting of phone numbers across services built in Go and Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'libphonenumber', github: "groyoh/libphonenumber-rb"
```

## Usage

```ruby
require "libphonenumber"

LibPhoneNumber.format_as_e164('+378886677', '') # => "+3780549886677"
LibPhoneNumber.format_as_national('+330618557497', 'FR') # => "0618557497"
LibPhoneNumber.get_region_code_from_phone_number('+330618557497') # => "FR"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

As this is an experiment, any issue or PR will be rejected.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

