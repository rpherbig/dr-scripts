require 'minitest/autorun'
require 'yaml'

class TestValidYaml < Minitest::Test
  def test_all_yaml_in_profiles
    count = 0
    Dir.glob('profiles/**/*.yaml').each do |file|
      count += 1
      YAML.load_file file
    end
    refute_equal count, 0, "Expected to load and parse at least one YAML file"
  end
end
