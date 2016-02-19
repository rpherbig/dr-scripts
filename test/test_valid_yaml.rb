require 'minitest/autorun'
require 'yaml'

class TestValidYaml < Minitest::Test
  def test_all_yaml_in_profiles
    Dir.glob('profiles/**/*.yaml').each do |file|
      YAML.load_file file
    end
  end
end
