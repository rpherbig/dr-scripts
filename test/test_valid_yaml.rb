require 'minitest/autorun'
require 'yaml'

class TestValidYaml < Minitest::Test
  def test_all_yaml_in_profiles
    count = 0
    Dir.glob('profiles/**/*.yaml').each do |file|
      count += 1
      YAML.load_file file
    end
    refute_equal count, 0, 'Expected to load and parse at least one YAML file'
  end

  def test_all_settings_in_base_yaml
    base = YAML.load_file('./profiles/base.yaml').keys
    base += YAML.load_file('./profiles/base-empty.yaml')['empty_values'].keys

    # Profiles using non-repo settings
    custom_profiles = %w[Moza Foedari Mozof Paven Rizzoli Chuno Jardani Sseng Vuulag Zamecki Erendel Shagium Crannach Dankmar Melborne Paeriluno Valkiss Ssarek Qetu Ugsy Valkiss Dartellum Leustyin Dijkstra Quillith Kyrtoth]

    nonbase = Dir.glob('./profiles/*.yaml')
                 .reject { |item| item == '.' }
                 .reject { |item| item == '..' }
                 .reject { |item| item.include?('base') }
                 .reject { |item| custom_profiles.any? { |prof| item.include?(prof) } }
                 .map { |item| YAML.load_file(item) }
                 .each_with_object({}) { |item, obj| obj.merge!(item) }
                 .keys

    refute_equal base.count, 0, 'Expected to find at least one setting in base.yaml'
    refute_equal nonbase.count, 0, 'Expected to find at least one setting in a non-base yaml'
    assert_equal nonbase - base, [], 'Expected all settings to be in base.yaml'
  end
end
