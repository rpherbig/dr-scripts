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

  def assert_following_npc
    proc { |error| assert($displayed_messages.any? { |message| message.include?('Following') }) }
  end

  def assert_search_adjacent_rooms
    proc { |error| assert($displayed_messages.any? { |message| message.include?('searching adjacent rooms') }) }
  end

  def assert_raise_error(error_class, error_message)
    proc do |error|
      assert_equal(error_class, error.class)
      assert(error.message.include?(error_message))
    end
  end

  def assert_mock(mock)
    proc { assert(mock.verify) if mock.class == Minitest::Mock }
  end

  def run_find(messages, script_args, fake_drc, fake_drct, fake_drroom, assertions = [], expected_errors = [])
    @test = run_script_with_proc(['find'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup
      $parsed_args = script_args.dup

      original_DRC = Find::DRC if defined?(Find::DRC)
      Find.send(:remove_const, "DRC") if defined?(Find::DRC)
      Find.const_set("DRC", fake_drc)

      original_DRCT = Find::DRCT if defined?(Find::DRCT)
      Find.send(:remove_const, "DRCT") if defined?(Find::DRCT)
      Find.const_set("DRCT", fake_drct)

      original_DRRoom = Harness::DRRoom if defined?(Harness::DRRoom)
      Harness.send(:remove_const, "DRRoom") if defined?(Harness::DRRoom)
      Harness.const_set("DRRoom", fake_drroom)

      # Test
      begin
        Find.new
        error = nil
      rescue Exception => e
        error = e
        unless expected_errors.include?(error.class)
          puts "\n#{error.class}: #{error.message}:\n"
          puts error.backtrace
          raise
        end
      end

      # Restore injected dependencies
      Find.send(:remove_const, "DRC") if defined?(Find::DRC)
      Find.const_set("DRC", original_DRC)

      Find.send(:remove_const, "DRCT") if defined?(Find::DRCT)
      Find.const_set("DRCT", original_DRCT)

      Harness.send(:remove_const, "DRRoom") if defined?(Harness::DRRoom)
      Harness.const_set("DRRoom", original_DRRoom)

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions += [assert_mock(fake_drc), assert_mock(fake_drct), assert_mock(fake_drroom)]
      assertions.each { |assertion| assertion.call(error) }
    end)
  end

  # For backwards compatibility with original version of 'find' that based on
  # the NPC name then knew the specific zone and rooms to look in, this method helps
  # us test that logic.
  def run_find_special_npc(script_args, npc, town, region, assertions = [])
    crossing_rooms = [1]
    crossing_academy = [2]
    dirge_rooms = [3]
    shard_rooms = [4]
    boar_clan_rooms = [5]
    boar_clan_pilgrimage_trail = [6]

    $test_data[:town] = OpenStruct.new({
      'Crossing' => {
        'wandering_npcs' => {
          'rooms' => crossing_rooms,
          'asemath_academy' => crossing_academy
        }
      },
      'Dirge' => {
        'wandering_npcs' => {
          'rooms' => dirge_rooms
        }
      },
      'Shard' => {
        'wandering_npcs' => {
          'rooms' => shard_rooms
        }
      },
      'Boar Clan' => {
        'wandering_npcs' => {
          'rooms' => boar_clan_rooms,
          'pilgrimage_trail' => boar_clan_pilgrimage_trail
        }
      }
    })

    messages = []

    fake_drc = Minitest::Mock.new
    fake_drct = Minitest::Mock.new
    fake_drroom = DRRoom # not mocked this test

    $test_data[:town][town]['wandering_npcs'][region].each do |room_id|
      fake_drct.expect(:walk_to, true) do |room_arg|
        if room_id == room_arg
          DRRoom.npcs = [npc]
          true
        else
          false
        end
      end
    end

    run_find(messages, script_args, fake_drc, fake_drct, fake_drroom, assertions)
  end

  def test_exit_script_if_no_npc_argument
    messages = []

    script_args = {}

    fake_drc = Minitest::Mock.new
    fake_drct = Minitest::Mock.new
    fake_drroom = DRRoom # not mocked this test

    run_find(messages, script_args, fake_drc, fake_drct, fake_drroom, [
      assert_raise_error(SystemExit, 'exit')
    ], [
      SystemExit
    ])
  end

  def test_find_npc_one_word
    rooms = [732, 741, 739]
    last_room = 734
    $test_data[:town] = OpenStruct.new({
      'Crossing' => {
        'wandering_npcs' => {
          'rooms' => rooms + [last_room]
        }
      }
    })

    messages = []

    script_args = {
      'npc' => 'beggar',
      'follow' => false
    }

    fake_drc = Minitest::Mock.new
    fake_drct = Minitest::Mock.new
    fake_drroom = DRRoom # not mocked this test

    # Walk some rooms without finding NPC
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

    run_find(messages, script_args, fake_drc, fake_drct, fake_drroom, [
      assert_find_npc()
    ])
  end

  def test_find_npc_full_name
    rooms = [732, 741, 739]
    last_room = 734
    $test_data[:town] = OpenStruct.new({
      'Crossing' => {
        'wandering_npcs' => {
          'rooms' => rooms + [last_room]
        }
      }
    })

    messages = []

    script_args = {
      'npc' => 'old blind beggar',
      'follow' => false
    }

    fake_drc = Minitest::Mock.new
    fake_drct = Minitest::Mock.new
    fake_drroom = DRRoom # not mocked this test

    # Walk some rooms without finding NPC
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

    run_find(messages, script_args, fake_drc, fake_drct, fake_drroom, [
      assert_find_npc()
    ])
  end

  def test_not_find_npc
    rooms = [732, 741, 739]
    last_room = 734
    $test_data[:town] = OpenStruct.new({
      'Crossing' => {
        'wandering_npcs' => {
          'rooms' => rooms + [last_room]
        }
      }
    })

    messages = []

    script_args = {
      'npc' => 'beggar',
      'follow' => false
    }

    fake_drc = Minitest::Mock.new
    fake_drct = Minitest::Mock.new
    fake_drroom = DRRoom # not mocked this test

    # Walk some rooms without finding NPC
    $test_data[:town]['Crossing']['wandering_npcs']['rooms'].each do |room_id|
      fake_drct.expect(:walk_to, true, [room_id])
    end

    run_find(messages, script_args, fake_drc, fake_drct, fake_drroom, [
      assert_not_find_npc()
    ])
  end

  def test_find_npc_without_moving
    rooms = [732, 741, 739]
    last_room = 734
    $test_data[:town] = OpenStruct.new({
      'Crossing' => {
        'wandering_npcs' => {
          'rooms' => rooms + [last_room]
        }
      }
    })

    messages = []

    script_args = {
      'npc' => 'beggar',
      'follow' => false
    }

    fake_drc = Minitest::Mock.new
    fake_drct = Minitest::Mock.new
    fake_drroom = DRRoom # not mocked this test

    # Find NPC in current room
    DRRoom.npcs = ['old blind beggar']

    run_find(messages, script_args, fake_drc, fake_drct, fake_drroom, [
      assert_find_npc()
    ])
  end

  def test_follow_npc
    rooms = [732, 741, 739]
    last_room = 734
    $test_data[:town] = OpenStruct.new({
      'Crossing' => {
        'wandering_npcs' => {
          'rooms' => rooms + [last_room]
        }
      }
    })

    messages = []

    script_args = {
      'npc' => 'beggar',
      'follow' => true
    }

    fake_drc = Minitest::Mock.new
    fake_drct = Minitest::Mock.new
    fake_drroom = Minitest::Mock.new

    # Simulate finding the NPC, following it, then losing it.
    # Note, if we don't lose the NPC then the script stays
    # in an infinite loop. The script must be forcefully terminated otherwise.
    fake_drroom.expect(:npcs, ['old blind beggar'], []) # Find NPC in current room
    fake_drroom.expect(:npcs, ['old blind beggar'], []) # Still see NPC when begin to follow it
    fake_drroom.expect(:npcs, ['old blind beggar'], []) # Still see NPC when check the room periodically
    fake_drroom.expect(:npcs, [], [])                   # Ack, the NPC has moved, go find it!
    fake_drroom.expect(:npcs, ['old blind beggar'], []) # Found NPC (again)
    fake_drroom.expect(:npcs, [], [])                   # Ack, the NPC has moved (again), go find it!
    fake_drroom.expect(:npcs, [], [])                   # Don't find NPC in surrounding rooms
    fake_drroom.expect(:npcs, [], [])                   # Don't find NPC in surrounding rooms

    # The mocked DRRoom handles when the NPC is seen.
    # This is mocking the movements when the script
    # was following the NPC, it moved, and now trying to refind it.
    Room.current.wayto.keys.each do |room_id|
      fake_drct.expect(:walk_to, true, [room_id])
    end

    run_find(messages, script_args, fake_drc, fake_drct, fake_drroom, [
      assert_following_npc(),
      assert_search_adjacent_rooms(),
      assert_not_find_npc()
    ])
  end

  # Tests the get_town_and_region method
  def test_find_ozursus_in_asemath_academy
    npc = 'ozursus'
    town = 'Crossing'
    region = 'asemath_academy'
    script_args = {
      'npc' => npc
      # use default town
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

  # Tests the get_town_and_region method
  def test_find_ozursus_not_in_asemath_academy
    npc = 'ozursus'
    town = 'Dirge'
    region = 'rooms'
    script_args = {
      'npc' => npc,
      'town' => town # use specific town
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

  # Tests the get_town_and_region method
  def test_find_shaman_in_dirge
    npc = 'shaman'
    town = 'Dirge'
    region = 'rooms'
    script_args = {
      'npc' => npc
      # use default town
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

  # Tests the get_town_and_region method
  def test_find_shaman_not_in_dirge
    npc = 'shaman'
    town = 'Crossing'
    region = 'rooms'
    script_args = {
      'npc' => npc,
      'town' => town # use specific town
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

  # Tests the get_town_and_region method
  def test_find_theurgist_in_shard
    npc = 'theurgist'
    town = 'Shard'
    region = 'rooms'
    script_args = {
      'npc' => npc
      # use default town
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

  # Tests the get_town_and_region method
  def test_find_theurgist_not_in_shard
    npc = 'theurgist'
    town = 'Crossing'
    region = 'rooms'
    script_args = {
      'npc' => npc,
      'town' => town # use specific town
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

  # Tests the get_town_and_region method
  def test_find_monk_in_boar_clan
    npc = 'monk'
    town = 'Boar Clan'
    region = 'pilgrimage_trail'
    script_args = {
      'npc' => npc
      # use default town
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

  # Tests the get_town_and_region method
  def test_find_monk_not_in_boar_clan
    npc = 'monk'
    town = 'Crossing'
    region = 'rooms'
    script_args = {
      'npc' => npc,
      'town' => town # use specific town
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

  # Tests the format_town method
  def test_format_town_boar_as_boar_clan
    npc = 'monk'
    town = 'Boar Clan'
    region = 'pilgrimage_trail'
    script_args = {
      'npc' => npc,
      'town' => 'Boar'
    }
    run_find_special_npc(script_args, npc, town, region, [
      assert_find_npc()
    ])
  end

end