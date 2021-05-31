require_relative 'test_helper'
require 'yaml'
require 'ostruct'

load 'test/test_harness.rb'

include Harness

class TestAfk < Minitest::Test

  def setup
    reset_data
  end

  def teardown
    @test.join if @test
  end

  def setup_settings(settings)
    $test_settings = OpenStruct.new(YAML.load_file('profiles/base.yaml').merge(settings))
  end

  def test_exits_if_dead_with_default_settings
    setup_settings({})
    expected_messages = ['exit']

    run_script('afk')

    sleep 0.2 # give script time to enter the main loop

    self.dead = true
    $history << 'another message'

    sleep 0.2 # give script time to pick up on above data changes

    assert_sends_messages(expected_messages)
  end

  def test_departs_if_dead_with_depart_on_death_enabled
    setup_settings('depart_on_death' => 'true')
    expected_messages = ['depart item', 'exit']

    run_script('afk')

    sleep 0.2 # give script time to enter the main loop

    self.dead = true
    $history << 'another message'

    sleep 0.2 # give script time to pick up on above data changes

    assert_sends_messages(expected_messages)
  end

  def test_exits_if_low_health
    setup_settings({})
    $history = ['You continue to braid your vines.', 'You are attacked by a Grue! Your injuries are severe.']
    expected_messages = ['health', 'avoid all', 'exit']

    run_script('afk')

    sleep 0.2 # give script time to enter the main loop

    self.health = 20
    $history << 'another message'

    sleep 0.2 # give script time to pick up on above data changes

    assert_sends_messages(expected_messages)
  end

  def test_exits_if_low_spirit
    setup_settings({})

    expected_messages = ['health', 'avoid all', 'exit']
    $history = ['You continue to braid your vines.', 'You are attacked by a Grue! Your injuries are severe.']

    run_script('afk')

    sleep 0.2 # give script time to enter the main loop

    self.spirit = 20
    $history << 'another message'

    sleep 0.2 # give script time to pick up on above data changes

    assert_sends_messages(expected_messages)
  end
end
