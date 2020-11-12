require 'minitest/autorun'
require 'yaml'
require 'ostruct'
load 'test/test_harness.rb'

include Harness

class TestDRCA < Minitest::Test
  def setup
    reset_data
    $history.clear
    sent_messages.clear
  end

class Settings
  def initialize
    @have_telescope = false
  end
  def have_telescope
    @have_telescope
  end
end

  def teardown
    @test.join if @test
  end

  def test_find_visible_planets_while_indoors
    $history = [
      'You get an ivory telescope inlaid with a ruby-eyed golden dragon from inside your hunting pack.',
      "That's a bit tough to do when you can't see the sky.",
      'You put your telescope in your hunting pack.'
    ]
    @test = run_script_with_proc(['common', 'common-arcana'], proc do
      settings = Settings.new

      seen_planets = DRCA.find_visible_planets(['a planet', 'another planet'], settings)
      assert_empty(seen_planets)
    end)
  end

  def test_invoke_with_exact_amount
    $test_data = {
      spells: OpenStruct.new(YAML.load_file('data/base-spells.yaml'))
    }
    $history = [
      'The nestled armband pulses with Lunar energy.  You reach for its center and forge a magical link to it, readying all of its mana for your use.',
      'Roundtime: 1 sec.'
    ]
    @test = run_script_with_proc(['common', 'common-arcana'], proc { DRCA.invoke('armband', nil, 32) })
    assert_sends_messages(['invoke my armband 32'])
  end

  def test_ritual_with_skip_retreat
    $test_data = {
      spells: OpenStruct.new(YAML.load_file('data/base-spells.yaml'))
    }
    spell_data = {
      'abbrev' => 'SPELL',
      'mana' => 1,
      'skip_retreat' => true,
      'before' => [],
      'after' => [],
      'cast_command' => 'cast',
      'focus' => 'staff',
      'worn_focus' => true,
      'ritual' => true
    }
    $history = [
      'Setting your Evasion stance to 100%, your Parry stance to 0%, and your Shield stance to 80%.  You have 12 stance points left.',
      'You feel intense strain as you try to manipulate the mana streams to form this pattern, and you are not certain that you will have enough mental stamina to complete it.',
      " However, if you utilize a ritual focus: That won't affect your current attunement very much.",
      'You spread your hands apart then slowly bring them together, fingers interlocked.',
      'You sling a crystal-inset oaken staff surmounted with a lumpy spleen off from over your shoulder.',
      'You lift your staff toward the sky and will the mana streams to bend into it.',
      'Roundtime: 20 sec.',
      'You sling a crystal-inset oaken staff surmounted with a lumpy spleen over your shoulder.',
      'You gaze towards the heavens seeking their silent guidance.',
      'The mental strain of this pattern is considerably eased by your ritual focus.',
      "At the ritual's peak, your prophetic connection blooms a thousand-fold.  You are alone.  An infinitesimal speck in space and time adrift in an infinite sea of possibility.  The course of your past, present and future are dictated by ceaseless currents beyond any mortal control."
    ]
    DRSkill._set_rank('Defending', 60)
    DRStats._set_guild('Barbarian')
    DRSpells._set_active_spells({})
    @test = run_script_with_proc(['common', 'common-arcana', 'common-travel'], proc { DRCA.ritual(spell_data, []) })
    assert_sends_messages(['stance set 100 0 81', 'prepare SPELL 1', 'remove my staff', 'invoke my staff', 'wear my staff', 'cast'])
  end
end
