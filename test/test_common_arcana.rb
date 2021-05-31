require_relative 'test_helper'
require 'yaml'
require 'ostruct'

load 'test/test_harness.rb'

include Harness

class TestDRCA < Minitest::Test

  def setup
    reset_data
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
      seen_planets = DRCA.find_visible_planets(['a planet', 'another planet'])
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
    @test = run_script_with_proc(['common', 'common-arcana'], proc do
      DRCA.invoke('armband', nil, 32)
      assert_sends_messages(['invoke my armband 32'])
    end)
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
      "However, if you utilize a ritual focus: That won't affect your current attunement very much.",
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
    DRStats.guild = 'Barbarian'
    DRSpells._set_active_spells({})
    @test = run_script_with_proc(['common', 'common-arcana'], proc do
      DRCA.ritual(spell_data, [])
      assert_sends_messages(['stance set 100 0 81', 'prepare SPELL 1', 'remove my staff', 'invoke my staff', 'wear my staff', 'cast'])
    end)
  end

  #########################################
  # SKILLED TO CHARGE WHILE WORN
  #########################################

  def test_skilled_to_charge_while_worn
    cambrinth_cap = 32
    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))
    @test = run_script_with_proc(['common-arcana'], proc do
      skilled = DRCA.skilled_to_charge_while_worn?(cambrinth_cap)
      assert_equal(true, skilled)
    end)
  end

  def test_not_skilled_to_charge_while_worn
    cambrinth_cap = 32
    DRSkill._set_rank('Arcana', 1)
    @test = run_script_with_proc(['common-arcana'], proc do
      skilled = DRCA.skilled_to_charge_while_worn?(cambrinth_cap)
      assert_equal(false, skilled)
    end)
  end

  #########################################
  # FIND CAMBRINTH
  #########################################

  def assert_found_cambrinth
    proc { |found_cambrinth| assert_equal(true, found_cambrinth) }
  end

  def assert_not_found_cambrinth
    proc { |found_cambrinth| assert_equal(false, found_cambrinth) }
  end

  def run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, assertions = [])
    @test = run_script_with_proc(['common-arcana'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup

      DRCA.send(:remove_const, "DRCI") if defined?(DRCA::DRCI)
      DRCA.const_set("DRCI", fake_drci)

      # Test
      found_cambrinth = DRCA.find_cambrinth(cambrinth, stored_cambrinth, cambrinth_cap)

      # Assert
      fake_drci.verify
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(found_cambrinth) }
    end)
  end

  def test_find_stored_cambrinth_by_get
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:get_item_if_not_held?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_found_cambrinth
    ])
  end

  def test_find_stored_cambrinth_by_remove
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:get_item_if_not_held?, false, [String])
    fake_drci.expect(:remove_item?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_found_cambrinth
    ])
  end

  def test_not_find_stored_cambrinth
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:get_item_if_not_held?, false, [String])
    fake_drci.expect(:remove_item?, false, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_not_found_cambrinth
    ])
  end

  def test_find_worn_cambrinth_in_hands
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', 1) # insufficient skill so must remove 'worn' cambrinth

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:in_hands?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_found_cambrinth
    ])
  end

  def test_find_worn_cambrinth_by_remove
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', 1) # insufficient skill so must remove 'worn' cambrinth

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:in_hands?, false, [String])
    fake_drci.expect(:remove_item?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_found_cambrinth
    ])
  end

  def test_find_worn_cambrinth_by_get
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', 1) # insufficient skill so must remove 'worn' cambrinth

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:in_hands?, false, [String])
    fake_drci.expect(:remove_item?, false, [String])
    fake_drci.expect(:get_item?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_found_cambrinth
    ])
  end

  def test_not_find_worn_cambrinth
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', 1) # insufficient skill so must remove 'worn' cambrinth

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:in_hands?, false, [String])
    fake_drci.expect(:remove_item?, false, [String])
    fake_drci.expect(:get_item?, false, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_not_found_cambrinth
    ])
  end

  #########################################
  # STOW CAMBRINTH
  #########################################

  def assert_stow_cambrinth
    proc { |stowed_cambrinth| assert_equal(true, stowed_cambrinth) }
  end

  def assert_not_stow_cambrinth
    proc { |stowed_cambrinth| assert_equal(false, stowed_cambrinth) }
  end

  def run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, assertions = [])
    @test = run_script_with_proc(['common-arcana'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup

      DRCA.send(:remove_const, "DRCI") if defined?(DRCA::DRCI)
      DRCA.const_set("DRCI", fake_drci)

      # Test
      stowed_cambrinth = DRCA.stow_cambrinth(cambrinth, stored_cambrinth, cambrinth_cap)

      # Assert
      fake_drci.verify
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(stowed_cambrinth) }
    end)
  end

  def test_stow_stored_cambrinth_by_get
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:get_item_if_not_held?, true, [String])
    fake_drci.expect(:stow_item?, true, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_stow_cambrinth
    ])
  end

  def test_stow_stored_cambrinth_by_wear
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:get_item_if_not_held?, false, [String])
    fake_drci.expect(:remove_item?, true, [String])
    fake_drci.expect(:stow_item?, true, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_stow_cambrinth
    ])
  end

  def test_not_stow_stored_cambrinth
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:get_item_if_not_held?, false, [String])
    fake_drci.expect(:remove_item?, false, [String])
    fake_drci.expect(:stow_item?, false, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_not_stow_cambrinth
    ])
  end

  def test_stow_worn_cambrinth_in_hands_by_wear
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:in_hands?, true, [String])
    fake_drci.expect(:wear_item?, true, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_stow_cambrinth
    ])
  end

  def test_stow_worn_cambrinth_in_hands_by_stow
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:in_hands?, true, [String])
    fake_drci.expect(:wear_item?, false, [String])
    fake_drci.expect(:stow_item?, true, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_stow_cambrinth
    ])
  end

  def test_not_stow_worn_cambrinth_in_hands
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:in_hands?, true, [String])
    fake_drci.expect(:wear_item?, false, [String])
    fake_drci.expect(:stow_item?, false, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_not_stow_cambrinth
    ])
  end

  def test_stow_worn_cambrinth_not_in_hands
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []

    fake_drci = Minitest::Mock.new
    fake_drci.expect(:in_hands?, false, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, fake_drci, [
      assert_stow_cambrinth
    ])
  end

end
