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
    proc { |error| refute($displayed_messages.any? { |message| message.include?('Failed to find an NPC') }) }
  end

  def assert_not_find_npc
    proc { |error| assert($displayed_messages.any? { |message| message.include?('Failed to find an NPC') }) }
  end

  def assert_raise_error(error_class, error_message)
    proc do |error|
      assert_equal(error.class, error_class)
      assert(error.message.include?(error_message))
    end
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
      begin
        Find.new
      rescue Exception => e
        # TODO need to raise if it's not expected
        #      but if it is, then don't fail (e.g. many scripts do 'exit' to end early)
        error = e
      end

      # Assert
      fake_drc.verify
      fake_drct.verify
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(error) }
    end)
  end

  def test_find_npc_one_word
    rooms = [732, 741, 739]
    last_room = 734
    $test_data[:find] = OpenStruct.new({
      'Crossing' => {
        'rooms' => rooms + [last_room]
      }
    })

    messages = []

    npc = 'beggar'

    fake_drc = Minitest::Mock.new

    fake_drct = Minitest::Mock.new
    rooms.each do |room_id|
      fake_drct.expect(:walk_to, true, [room_id])
    end
    # Find the NPC in the last room we check
    fake_drct.expect(:walk_to, true) do |room_id|
      if room_id == last_room
        DRRoom.npcs = ['old blind beggar']
        true
      else
        false
      end
    end

    run_find(messages, npc, fake_drc, fake_drct, [
      assert_find_npc()
    ])
  end

  def test_find_npc_full_name
    rooms = [732, 741, 739]
    last_room = 734
    $test_data[:find] = OpenStruct.new({
      'Crossing' => {
        'rooms' => rooms + [last_room]
      }
    })

    messages = []

    npc = 'old blind beggar'

    fake_drc = Minitest::Mock.new

    fake_drct = Minitest::Mock.new
    rooms.each do |room_id|
      fake_drct.expect(:walk_to, true, [room_id])
    end
    # Find the NPC in the last room we check
    fake_drct.expect(:walk_to, true) do |room_id|
      if room_id == last_room
        DRRoom.npcs = ['old blind beggar']
        true
      else
        false
      end
    end

    run_find(messages, npc, fake_drc, fake_drct, [
      assert_find_npc()
    ])
  end

  def test_not_find_npc
    rooms = [732, 741, 739]
    last_room = 734
    $test_data[:find] = OpenStruct.new({
      'Crossing' => {
        'rooms' => rooms + [last_room]
      }
    })

    messages = []

    npc = 'beggar'

    fake_drc = Minitest::Mock.new

    fake_drct = Minitest::Mock.new
    $test_data[:find]['Crossing']['rooms'].each do |room_id|
      fake_drct.expect(:walk_to, true, [room_id])
    end

    run_find(messages, npc, fake_drc, fake_drct, [
      assert_not_find_npc(),
      assert_raise_error(SystemExit, 'exit')
    ])
  end

end