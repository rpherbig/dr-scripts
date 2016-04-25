#!/usr/bin/env rake

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = Dir.glob('test/**/test_*.rb')
  t.warning = false
end

task(default: :test)
