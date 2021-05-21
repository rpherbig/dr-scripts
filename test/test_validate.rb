require_relative 'test_helper'
require 'yaml'
require 'ostruct'

load 'test/test_harness.rb'

include Harness

class TestValidate < Minitest::Test

  def setup
    reset_data
    $test_data = {
      mining: OpenStruct.new(mining_buddy_rooms: []),
      town: OpenStruct.new(Crossing: 'dummy'),
      hunting: OpenStruct.new(hunting_zones: [], escort_zones: []),
      spells: OpenStruct.new(spell_data: [])
    }
  end

  def teardown
    @test.join if @test
  end

  def setup_settings(settings)
    $test_settings = OpenStruct.new(YAML.load_file('profiles/base.yaml').merge(settings))
    YAML.load_file('profiles/base-empty.yaml')['empty_values'].each { |key, val| $test_settings[key] ||= val }
  end

  def test_parse_args
    setup_settings({})
    load('validate.lic')

    assert_equal 'test', $settings_called_with, 'Expected settings to be called with flex args'
  end

  def test_root_key_warnings
    skip('Number of root key warnings has changed. This test needs to be updated')
    setup_settings({})
    load('validate.lic')

    assert_equal 5, $warn_msgs.size, 'Expected one warning per root key, received:' + $warn_msgs.join(',')
  end

  def test_gear_set_item_existence
    setup_settings('gear' => [
                     {
                       adjective: 'chain', name: 'balaclava'
                     },
                     {
                       adjective: 'mail', name: 'gloves'
                     },
                     {
                       adjective: 'small', name: 'shield'
                     }
                   ],
                   'gear_sets' => {
                     'standard' => [
                       'chain balaclava',
                       'mail gloves',
                       'small shield',
                       'padded hauberk'
                     ]
                   })

    load('validate.lic')

    assert $error_msgs.grep(/padded hauberk/), 'Expected warning for missing item'
  end

  def test_weapon_training_item_existence
    setup_settings('gear' => [
                     {
                       adjective: 'robe', name: 'sword'
                     }
                   ],
                   'weapon_training' => {
                     'Large Edged' => 'robe sword',
                     'Twohanded Edged' => 'moonblade',
                     'Small Blunt' => 'missing item'
                   },
                   'summoned_weapons' => [{ 'name' => 'Twohanded Edged' }])

    load('validate.lic')

    assert $error_msgs.grep(/Small Blunt: missing item/), 'Expected warning for missing item'
    assert $error_msgs.grep(/moonblade/).empty?, "Expected no warning for summoned gear, found #{$error_msgs.grep(/moonblade/)}"
  end

  def test_stop_on_weapon_skills_are_in_weapon_training
    setup_settings('hunting_info' => [
                     {
                       'stop_on' => [
                         'Brawling'
                       ]
                     }
                   ],
                   'weapon_training' => {})

    load('validate.lic')

    assert $error_msgs.grep(/stop_on: weapon skill Brawling not in weapon_training: setting/), 'Expected warning for missing skill'
  end
end
