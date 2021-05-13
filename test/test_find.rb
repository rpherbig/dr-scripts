require_relative 'test_helper'

load 'test/test_harness.rb'

include Harness

class TestFind < Minitest::Test

  def setup
    reset_data
    $history.clear
    $server_buffer.clear
    sent_messages.clear
    displayed_messages.clear
  end

  def teardown
    @test.join if @test
  end

  def assert_find_npc
    proc { refute($displayed_messages.any? { |message| message.include?('Failed to find an NPC') }) }
  end

  def assert_not_find_npc
    proc { assert($displayed_messages.any? { |message| message.include?('Failed to find an NPC') }) }
  end

  def run_find(messages, npc, fake_drc, fake_drct, assertions = [])
    @test = run_script_with_proc(['find'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup
      $parsed_args = {
        'npc' => npc
      }

      Find.send(:remove_const, "DRC") if defined?(Find::DRC)
      Find.const_set("DRC", fake_drc)

      Find.send(:remove_const, "DRCT") if defined?(Find::DRCT)
      Find.const_set("DRCT", fake_drct)

      # Test
      Find.new

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call() }
    end)
  end

  def test_find_npc_one_word
    messages = []

    npc = 'beggar'

    fake_drc = Minitest::Mock.new

    fake_drct = Minitest::Mock.new
    [793, 792, 791, 789].each do |room_id|
      fake_drct.expect(:walk_to, true, [room_id])
    end
    fake_drct.expect(:walk_to, true) do |room_id|
      DRRoom.npcs = ['old blind beggar']
    end

    run_find(messages, npc, fake_drc, fake_drct, [
      assert_find_npc
    ])
  end

  def test_find_npc_full_name
    messages = []

    npc = 'old blind beggar'

    fake_drc = Minitest::Mock.new

    fake_drct = Minitest::Mock.new
    [793, 792, 791, 789].each do |room_id|
      fake_drct.expect(:walk_to, true, [room_id])
    end
    fake_drct.expect(:walk_to, true) do |room_id|
      DRRoom.npcs = ['old blind beggar']
    end

    run_find(messages, npc, fake_drc, fake_drct, [
      assert_find_npc
    ])
  end

  def test_not_find_npc
    messages = []

    npc = 'beggar'

    fake_drc = Minitest::Mock.new

    fake_drct = Minitest::Mock.new
    [793, 792, 791, 789].each do |room_id|
      fake_drct.expect(:walk_to, true, [room_id])
    end
    fake_drct.expect(:walk_to, true) do |room_id|
      DRRoom.npcs = ['street urchin']
    end

    run_find(messages, npc, fake_drc, fake_drct, [
      assert_not_find_npc
    ])
  end

end