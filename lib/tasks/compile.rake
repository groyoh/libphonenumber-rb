# frozen_string_literal: true

task :compile do
  mkdir_p 'tmp/libphonenumber'
  cp Dir['ext/libphonenumber/*'], 'tmp/libphonenumber/'
  Dir.chdir('ext/libphonenumber/') do
    ruby 'extconf.rb'
    sh 'make'
  end
  rm_rf 'tmp'
end
