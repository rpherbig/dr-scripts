#!/usr/bin/env rake

require 'rake/testtask'
require 'fileutils'

TEST_TMP_DIR = 'test/tmp'

Rake::TestTask.new do |t|
  t.test_files = Dir.glob('test/**/test_*.rb')
  t.warning = false
end

# To collect test code coverage with the simplecov gem
# then the scripts MUST be launched via `require_relative` command.
# To be launched via `require_relative` command
# then the scripts MUST use the `.rb` extension.
#
# This task copies the *.lic scripts into a temp directory
# and renames them to have *.rb extension to satisfy above requirement.
# The tests themselves load and execute the *.rb copies.
# See the `run_script_with_proc` method in test_harness.rb for more details.
task(:create_test_scripts) do |t|
  FileUtils.remove_dir(TEST_TMP_DIR, true)
  FileUtils.mkdir_p(TEST_TMP_DIR)
  Dir.glob('*.lic').each do |file|
    FileUtils.copy_file(
      file,
      "#{TEST_TMP_DIR}/#{File.basename(file, '.lic') + '.rb'}"
    )
  end
end

task(:test => [:create_test_scripts]) do
  # Once task is complete, delete the temp files
  FileUtils.remove_dir(TEST_TMP_DIR)
end

task(default: :test)
