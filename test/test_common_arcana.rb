require_relative 'test_helper'
require 'yaml'

load 'test/test_harness.rb'

include Harness

class TestDRCA < Minitest::Test

  def setup
    if defined?(DRCA)
      Object.send(:remove_const, :DRCA)
      $LOADED_FEATURES.delete_if {|file| file =~ /common/}
    end
    reset_data
    $test_data = { :spells => OpenStruct.new({ :khri_preps => ['match strings'] })}
    @fake_drc = Minitest::Mock.new
    @fake_drci = Minitest::Mock.new
    load_base_settings
  end

  def teardown
    @test.join if @test
  end

  def load_base_settings(settings = {})
    $test_settings = OpenStruct.new(YAML.load_file('profiles/base.yaml').merge(settings))
    YAML.load_file('profiles/base-empty.yaml')['empty_values'].each { |key, val| $test_settings[key] ||= val }
  end

  def test_find_visible_planets_while_indoors
    $history = [
      'You get an ivory telescope inlaid with a ruby-eyed golden dragon from inside your hunting pack.',
      "That's a bit tough to do when you can't see the sky.",
      'You put your telescope in your hunting pack.'
    ]
    @test = run_script_with_proc(['common', 'common-items', 'common-arcana'], proc do
      DRCA.const_set("DRC", DRC) unless defined?(DRCA::DRC)
      DRCA.const_set("DRCI", DRCI) unless defined?(DRCA::DRCI)

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
    @test = run_script_with_proc(['common', 'common-items', 'common-arcana'], proc do
      DRCA.const_set("DRC", DRC) unless defined?(DRCA::DRC)
      DRCA.const_set("DRCI", DRCI) unless defined?(DRCA::DRCI)

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
    @test = run_script_with_proc(['common', 'common-items', 'common-arcana'], proc do
      DRCA.const_set("DRC", DRC) unless defined?(DRCA::DRC)
      DRCA.const_set("DRCI", DRCI) unless defined?(DRCA::DRCI)

      DRCA.ritual(spell_data, [])
      assert_sends_messages(['stance set 100 0 81', 'prepare SPELL 1', 'remove my staff', 'invoke my staff', 'wear my staff', 'cast'])
    end)
  end

  #########################################
  # ACTIVATE KHRI
  #########################################

  def run_activate_khri_test_with_mocks(kneel, khri, expectation)
    @test = run_script_with_proc(['common-arcana'], proc do
      DRCA.send(:remove_const, "DRC") if defined?(DRCA::DRC)
      DRCA.const_set("DRC", @fake_drc)

      activated = DRCA.activate_khri?(kneel, khri)
      assert_equal(expectation, activated)
    end)
  end

  def test_handles_single_khri_not_running_no_kneeling
    @fake_drc.expect(:bput, "foo", ['Khri Hasten', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'Hasten', true)
  end

  def test_handles_single_khri_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    run_activate_khri_test_with_mocks(false, 'Hasten', true)
  end

  def test_handles_single_khri_with_prefix_not_running_no_kneeling
    @fake_drc.expect(:bput, "foo", ['Khri Hasten', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'khri Hasten', true)
  end

  def test_handles_single_khri_with_prefix_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    run_activate_khri_test_with_mocks(false, 'KHRI Hasten', true)
  end

  def test_handles_delayed_single_khri_not_running_no_kneeling
    @fake_drc.expect(:bput, "You begin to draw your focus on increasing your celerity of motion", ['Khri Delay Hasten', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'delay HASTEN', true)
  end

  def test_handles_delayed_single_khri_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    run_activate_khri_test_with_mocks(false, 'delay hasten', true)
  end

  def test_handles_delayed_single_khri_with_prefix_not_running_no_kneeling
    @fake_drc.expect(:bput, "foo", ['Khri Delay Hasten', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'KHRI DELAY HASTEN', true)
  end

  def test_handles_delayed_single_khri_with_prefix_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    run_activate_khri_test_with_mocks(false, 'khri delay hasten', true)
  end

  def test_handles_mulitple_khri_not_running_no_kneeling
    @fake_drc.expect(:bput, "foo", ['Khri Dampen Hasten', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'DAMPEN HASTEN', true)
  end

  def test_handles_multiple_khri_some_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    @fake_drc.expect(:bput, "foo", ['Khri Dampen', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'DAMPEN HASTEN', true)
  end

  def test_handles_mulitple_khri_with_prefix_not_running_no_kneeling
    @fake_drc.expect(:bput, "foo", ['Khri Dampen Hasten', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'khri DAMPEN HASTEN', true)
  end

  def test_handles_multiple_khri_with_prefix_some_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    @fake_drc.expect(:bput, "foo", ['Khri Dampen', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'khri DAMPEN HASTEN', true)
  end

  def test_handles_multiple_khri_all_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3, "Khri Dampen" => 5})
    run_activate_khri_test_with_mocks(false, 'DAMPEN HASTEN', true)
  end

  def test_handles_multiple_khri_with_prefix_all_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3, "Khri Dampen" => 5})
    run_activate_khri_test_with_mocks(false, 'khri DAMPEN HASTEN', true)
  end

  def test_handles_delayed_mulitple_khri_not_running_no_kneeling
    @fake_drc.expect(:bput, "foo", ['Khri Delay Dampen Hasten', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'delay DAMPEN HASTEN', true)
  end

  def test_handles_delayed_multiple_khri_some_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    @fake_drc.expect(:bput, "foo", ['Khri Delay Dampen', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'delay DAMPEN HASTEN', true)
  end

  def test_handles_delayed_mulitple_khri_with_prefix_not_running_no_kneeling
    @fake_drc.expect(:bput, "foo", ['Khri Delay Dampen Hasten', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'khri delay DAMPEN hASTEN', true)
  end

  def test_handles_delayed_multiple_khri_with_prefix_some_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    @fake_drc.expect(:bput, "foo", ['Khri Delay Dampen', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'khri delay DAMPEN hASten', true)
  end

  def test_handles_delayed_multiple_khri_all_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3, "Khri Dampen" => 5})
    run_activate_khri_test_with_mocks(false, 'delay DAMPEN HASTEN', true)
  end

  def test_handles_delayed_multiple_khri_with_prefix_all_running_no_kneeling
    DRSpells._set_active_spells({"Khri Hasten" => 3, "Khri Dampen" => 5})
    run_activate_khri_test_with_mocks(false, 'khri DELay DAMPEN HASTEN', true)
  end

  def test_handles_delayed_multiple_khri_with_prefix_some_running_no_kneeling_failure
    DRSpells._set_active_spells({"Khri Hasten" => 3})
    # You have not recovered from your previous use of the Hasten meditation.
    @fake_drc.expect(:bput, 'You have not recovered', ['Khri Delay Dampen', Array])
    @fake_drc.expect(:fix_standing, nil)
    run_activate_khri_test_with_mocks(false, 'khri delay DAMPEN hASten', false)
  end

  #########################################
  # SKILLED TO CHARGE WHILE WORN
  #########################################

  def test_skilled_to_charge_while_worn
    cambrinth_cap = 32
    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))
    @test = run_script_with_proc(['common', 'common-items', 'common-arcana'], proc do
      DRCA.const_set("DRC", DRC) unless defined?(DRCA::DRC)
      DRCA.const_set("DRCI", DRCI) unless defined?(DRCA::DRCI)

      skilled = DRCA.skilled_to_charge_while_worn?(cambrinth_cap)
      assert_equal(true, skilled)
    end)
  end

  def test_not_skilled_to_charge_while_worn
    cambrinth_cap = 32
    DRSkill._set_rank('Arcana', 1)
    @test = run_script_with_proc(['common', 'common-items', 'common-arcana'], proc do
      DRCA.const_set("DRC", DRC) unless defined?(DRCA::DRC)
      DRCA.const_set("DRCI", DRCI) unless defined?(DRCA::DRCI)

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

  def run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, assertions = [])
    @test = run_script_with_proc(['common', 'common-arcana'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup
      DRCA.const_set("DRCI", @fake_drci)

      # Test
      found_cambrinth = DRCA.find_cambrinth(cambrinth, stored_cambrinth, cambrinth_cap)

      # Assert
      @fake_drci.verify
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(found_cambrinth) }
    end)
  end

  def test_find_stored_cambrinth_by_get
    messages = []
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32
    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))
    @fake_drci.expect(:get_item_if_not_held?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_found_cambrinth
    ])
  end

  def test_find_stored_cambrinth_by_remove
    messages = []
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32
    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))
    @fake_drci.expect(:get_item_if_not_held?, false, [String])
    @fake_drci.expect(:remove_item?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_found_cambrinth
    ])
  end

  def test_not_find_stored_cambrinth
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []
    @fake_drci.expect(:get_item_if_not_held?, false, [String])
    @fake_drci.expect(:remove_item?, false, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_not_found_cambrinth
    ])
  end

  def test_find_worn_cambrinth_in_hands
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', 1) # insufficient skill so must remove 'worn' cambrinth

    messages = []
    @fake_drci.expect(:in_hands?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_found_cambrinth
    ])
  end

  def test_find_worn_cambrinth_by_remove
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', 1) # insufficient skill so must remove 'worn' cambrinth

    messages = []
    @fake_drci.expect(:in_hands?, false, [String])
    @fake_drci.expect(:remove_item?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_found_cambrinth
    ])
  end

  def test_find_worn_cambrinth_by_get
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', 1) # insufficient skill so must remove 'worn' cambrinth

    messages = []
    @fake_drci.expect(:in_hands?, false, [String])
    @fake_drci.expect(:remove_item?, false, [String])
    @fake_drci.expect(:get_item?, true, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_found_cambrinth
    ])
  end

  def test_not_find_worn_cambrinth
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', 1) # insufficient skill so must remove 'worn' cambrinth

    messages = []
    @fake_drci.expect(:in_hands?, false, [String])
    @fake_drci.expect(:remove_item?, false, [String])
    @fake_drci.expect(:get_item?, false, [String])

    run_find_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
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

  def run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, assertions = [])
    @test = run_script_with_proc(['common', 'common-arcana'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup
      DRCA.const_set("DRCI", @fake_drci)

      # Test
      stowed_cambrinth = DRCA.stow_cambrinth(cambrinth, stored_cambrinth, cambrinth_cap)

      # Assert
      @fake_drci.verify
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
    @fake_drci.expect(:get_item_if_not_held?, true, [String])
    @fake_drci.expect(:stow_item?, true, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_stow_cambrinth
    ])
  end

  def test_stow_stored_cambrinth_by_wear
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []
    @fake_drci.expect(:get_item_if_not_held?, false, [String])
    @fake_drci.expect(:remove_item?, true, [String])
    @fake_drci.expect(:stow_item?, true, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_stow_cambrinth
    ])
  end

  def test_not_stow_stored_cambrinth
    cambrinth = 'cambrinth armband'
    stored_cambrinth = true
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []
    @fake_drci.expect(:get_item_if_not_held?, false, [String])
    @fake_drci.expect(:remove_item?, false, [String])
    @fake_drci.expect(:stow_item?, false, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_not_stow_cambrinth
    ])
  end

  def test_stow_worn_cambrinth_in_hands_by_wear
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []
    @fake_drci.expect(:in_hands?, true, [String])
    @fake_drci.expect(:wear_item?, true, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_stow_cambrinth
    ])
  end

  def test_stow_worn_cambrinth_in_hands_by_stow
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []
    @fake_drci.expect(:in_hands?, true, [String])
    @fake_drci.expect(:wear_item?, false, [String])
    @fake_drci.expect(:stow_item?, true, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_stow_cambrinth
    ])
  end

  def test_not_stow_worn_cambrinth_in_hands
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []
    @fake_drci.expect(:in_hands?, true, [String])
    @fake_drci.expect(:wear_item?, false, [String])
    @fake_drci.expect(:stow_item?, false, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_not_stow_cambrinth
    ])
  end

  def test_stow_worn_cambrinth_not_in_hands
    cambrinth = 'cambrinth armband'
    stored_cambrinth = false
    cambrinth_cap = 32

    DRSkill._set_rank('Arcana', ((cambrinth_cap.to_i * 2) + 100))

    messages = []
    @fake_drci.expect(:in_hands?, false, [String])

    run_stow_cambrinth(messages, cambrinth, stored_cambrinth, cambrinth_cap, [
      assert_stow_cambrinth
    ])
  end

  #########################################
  # ACTIVATE BARBARIAN BUFFS
  #########################################

  def assert_activated_barb_buff
    proc { |activated_buff| assert_equal(true, activated_buff) }
  end

  def assert_not_activated_barb_buff
    proc { |activated_buff| assert_equal(false, activated_buff) }
  end

  def run_activate_barb_buff(messages, ability, meditation_pause_timer, sit_to_meditate, fake_drc, assertions = [], expected_errors = [])
    @test = run_script_with_proc(['common', 'common-items', 'common-arcana'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup

      mocks = [fake_drc]

      original_DRC = DRCA::DRC if defined?(DRCA::DRC)
      DRCA.send(:remove_const, "DRC") if defined?(DRCA::DRC)
      DRCA.const_set("DRC", fake_drc)

      # Test
      begin
        activated_buff = DRCA.activate_barb_buff?(ability, meditation_pause_timer, sit_to_meditate)
      rescue Exception => e
        error = e
        unless expected_errors.include?(error.class)
          flunk(exception_details(e, 'Unexpected error running test'))
        end
      end

      # Restore injected dependencies
      DRCA.send(:remove_const, "DRC") if defined?(DRCA::DRC)
      DRCA.const_set("DRC", original_DRC)

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      mocks.each { |mock| assertions << proc { assert_mock(mock) } if mock.class == Minitest::Mock }
      assertions.each { |assertion| assertion.call(activated_buff) }
    end)
  end

  def test_barb_buff_sits_to_meditate
    $test_data = {
      spells: OpenStruct.new(YAML.load_file('data/base-spells.yaml'))
    }

    ability = 'Contemplation'
    meditation_pause_timer = 10
    sit_to_meditate = true

    messages = []

    fake_drc = Minitest::Mock.new
    fake_drc.expect(:retreat, true, [])
    fake_drc.expect(:bput, "You sit.", ['sit', 'You sit', 'You are already', 'You rise', 'While swimming?'])
    fake_drc.expect(:bput, "You begin to meditate upon the chakrel amulet, your inner fire swelling as you center your mind, body, and spirit.") do |arg_command, *arg_matches|
      arg_command == 'meditate contemplation'
    end
    fake_drc.expect(:fix_standing, true)

    run_activate_barb_buff(messages, ability, meditation_pause_timer, sit_to_meditate, fake_drc, [
      assert_activated_barb_buff
    ])
  end

  def test_barb_buff_not_sits_to_meditate
    $test_data = {
      spells: OpenStruct.new(YAML.load_file('data/base-spells.yaml'))
    }

    ability = 'Contemplation'
    meditation_pause_timer = 10
    sit_to_meditate = false

    messages = []

    fake_drc = Minitest::Mock.new
    fake_drc.expect(:bput, "You begin to meditate upon the chakrel amulet, your inner fire swelling as you center your mind, body, and spirit.") do |arg_command, *arg_matches|
      arg_command == 'meditate contemplation'
    end
    fake_drc.expect(:fix_standing, true)

    run_activate_barb_buff(messages, ability, meditation_pause_timer, sit_to_meditate, fake_drc, [
      assert_activated_barb_buff
    ])
  end

end
