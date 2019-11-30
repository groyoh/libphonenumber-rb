# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'libphonenumber'
require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'
