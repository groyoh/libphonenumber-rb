# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'libphonenumber/version'

Gem::Specification.new do |spec|
  spec.name          = 'libphonenumber'
  spec.version       = LibPhoneNumber::VERSION
  spec.authors       = ['Yohan Robert']
  spec.email         = ['yohan.robert@outlook.fr']

  spec.summary       = 'libphonenumber Go lib bindings'
  spec.description   = 'Experimental wrapper around libphonenumber Go library'
  spec.homepage      = 'https://github.com/heetch/libphonenumber-rb'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ''
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.extensions = %w[ext/libphonenumber/extconf.rb]

  spec.add_dependency 'ffi', '~> 1.0'

  spec.add_development_dependency 'ataru', '~> 0.2.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
