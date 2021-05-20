require_relative 'test_helper'

load 'test/test_harness.rb'

include Harness

class TestSpellMonitor < Minitest::Test

  def setup
    reset_data
  end

  def teardown
    @test.join if @test
  end

  #########################################
  # ACTIVE/KNOWN SPELLS/FEATS
  #########################################

  def assert_active_spell(name, duration)
    proc { |active_spells, known_spells, known_feats, has_slivers| assert_equal(duration, active_spells[name], "Checking for active spell: #{name}, #{active_spells}") }
  end

  def assert_know_spell(name, is_known)
    proc { |active_spells, known_spells, known_feats, has_slivers| assert_equal(is_known, !!known_spells[name], "Checking for known spell: #{name}, #{known_spells}") }
  end

  def assert_know_feat(name, is_known)
    proc { |active_spells, known_spells, known_feats, has_slivers| assert_equal(is_known, !!known_feats[name], "Checking for known feat: #{name}, #{known_feats}") }
  end

  def assert_has_slivers
    proc { |active_spells, known_spells, known_feats, has_slivers| assert(has_slivers, "Expected to have orbiting slivers") }
  end

  def run_downstream_hook(messages, assertions = [])
    @test = run_script_with_proc(['spellmonitor'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup

      # Test
      messages.each { |message| DownstreamHook.run(message) }

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(DRSpells.active_spells, DRSpells.known_spells, DRSpells.known_feats, DRSpells.slivers) }
    end)
  end

  def test_detect_active_spells
    messages = [
      '<clearStream id="percWindow"/>',
      '<pushStream id="percWindow"/>Bless (5 roisaen)',
      '<popStream/><pushStream id="percWindow"/>Righteous Wrath (8 roisaen)',
      'Rage of the Clans  (4 roisaen)',
      '<popStream/><pushStream id="percWindow"/> Avalanche (thoroughly inflamed)',
      '<popStream/><pushStream id="percWindow"/>Khri Hasten (fading)',
      '<popStream/><pushStream id="percWindow"/>Mantle of Flame (indefinite)',
      '<popStream/><pushStream id="percWindow"/>Persistence of Mana (om)',
      '<popStream/><pushStream id="percWindow"/>Many small orbiting slivers of lunar magic',
      '<popStream/>'
    ]
    run_downstream_hook(messages, [
      assert_active_spell('Bless', 5),
      assert_active_spell('Righteous Wrath', 8),
      assert_active_spell('Rage of the Clans', 4),
      assert_active_spell('Avalanche', 1000),
      assert_active_spell('Khri Hasten', 0),
      assert_active_spell('Mantle of Flame', 1000),
      assert_active_spell('Persistence of Mana', 1000),
      assert_has_slivers()
    ])
  end

  def test_detect_known_spells
    messages = [
      "You recall the spells you have learned from your training.",
      "In the chapter entitled \"Perception\", you have notes on the Clear Vision [cv], Piercing Gaze [pg], Locate, Seer's Sense [seer], and Aura Sight [aus] spells.",
      "In the chapter entitled \"Psychic Projection\", you have notes on the Calm, Telekinetic Throw [tkt], Telekinetic Storm [tks], and Psychic Shield [psy] spells.",
      "In the chapter entitled \"Moonlight Manipulation\", you have notes on the Shadows, Focus Moonbeam [fm], Dazzle, Refractive Field [rf], Burn, Moonblade, Dinazen Olkar [do], Shape Moonblade [shmo], Cage of Light [col], and Shift Moonbeam [sm] spells.",
      "In the chapter entitled \"Enlightened Geometry\", you have notes on the Partial Displacement [pd], Teleport, and Moongate [mg] spells.",
      "You have temporarily memorized the Minor Physical Protection [mpp] spell.",
      "You recall proficiency with the magic feats of Basic Preparation Recognition, Augmentation Mastery, Utility Mastery, Warding Mastery, Cautious Casting, Injured Casting, Deep Attunement, Raw Channeling, Efficient Channeling, Efficient Harnessing and Magic Theorist.",
      "You have 1 spell slot available.",
      "You are NOT currently set to recognize known spells when prepared by someone else in the area.  (Use SPELL RECOGNIZE ON to change this.)",
      "You are currently set to display full cast messaging.  (Use SPELL BRIEFMSG ON to change this.)",
      "You are currently attempting to hide your spell preparing.  (Use PREPARE /HIDE to change this.)",
      "You can use SPELL STANCE [HELP] to view or modify your spellcasting preferences."
    ]
    run_downstream_hook(messages, [
      # Spells
      assert_know_spell("Bless", false),
      assert_know_spell("Clear Vision", true),
      assert_know_spell("Locate", true),
      assert_know_spell("Seer's Sense", true),
      assert_know_spell("Aura Sight", true),
      # Scroll
      assert_know_spell("Minor Physical Protection", true),
      # Feats
      assert_know_feat("Basic Preparation Recognition", true),
      assert_know_feat("Augmentation Mastery", true),
      assert_know_feat("Utility Mastery", true),
      assert_know_feat("Cautious Casting", true),
      assert_know_feat("Efficient Harnessing", true),
      assert_know_feat("Magic Theorist", true)
    ])
  end

end