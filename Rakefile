# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

Rake.add_rakelib 'lib/tasks'

Rake::TestTask.new(test: [:compile]) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test
