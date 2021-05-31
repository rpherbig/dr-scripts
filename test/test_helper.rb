##
# Running all MiniTest Tests with SimpleCov
# https://gist.github.com/jcasimir/3c687bd5db16a73b4cf3
##

require 'simplecov'            # These two lines must go first
SimpleCov.start do

  # Set default coverage metric as line coverage.
  # https://github.com/simplecov-ruby/simplecov#primary-coverage
  primary_coverage(:line)

  # Enable conditional branch logic coverage (if/else, case/when)
  # https://github.com/simplecov-ruby/simplecov#branch-coverage-ruby--25
  enable_coverage(:branch)

  # Organize coverage results into groups
  # https://github.com/simplecov-ruby/simplecov#groups
  add_group("common") do |file|
    File.basename(file.filename) =~ /^common.*/
  end

  add_group("core") do |file|
    File.basename(file.filename) =~ /^(bootstrap|dependency|drinfomon|events|get2|go2|skill-recorder|spellmonitor|validate).*/
  end

  add_group("tests") do |file|
    File.basename(file.filename) =~ /^test_.*/
  end

end

require 'minitest/autorun'     # Sets up minitest
                               # You could require other shared gems here, too