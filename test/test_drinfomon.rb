require 'minitest/autorun'
require 'timecop'
load 'test/test_harness.rb'

include Harness

def before_dying(&code)
  Script.at_exit(&code)
end

class Char
  def self.name
    'McTesterson'
  end
end

class CharSettings
  def self.[](_name); end
  def self.[]=(_name, _value);end
end

class XMLData
  def self.game
    'DR'
  end
end

class UpstreamHook
  def self.add(*);end
  def self.remove(*);end
end

class DownstreamHook
  def self.add(*);end
  def self.remove(*);end
end

class TestDrinfomon < Minitest::Test
  def test_sends_info_on_startup_when_alive
    self.dead = false
    run_script('drinfomon.lic')
    assert_sends_messages(['exp all', 'info'])
  end

  def test_skips_info_on_startup_when_dead
    self.dead = true
    run_script('drinfomon.lic')
    assert_sends_messages(['exp all'])
  end

  def test_sends_info_after_departing
    self.dead = true
    run_script('drinfomon.lic')
    sent_messages.clear
    Timecop.scale(60)
    self.dead = false
    sleep(0.1)
    Timecop.return()
    assert_sends_messages(['info'])
  end
end