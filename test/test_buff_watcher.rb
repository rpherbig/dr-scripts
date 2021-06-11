require_relative 'test_helper'
require 'yaml'

load 'test/test_harness.rb'

include Harness

class TestBuffWatcher < Minitest::Test

  def setup
    reset_data
    load_base_settings
  end

  def teardown
    @test.join if @test
  end

  def load_base_settings(settings = {})
    $test_settings = OpenStruct.new(YAML.load_file('profiles/base.yaml').merge(settings))
    YAML.load_file('profiles/base-empty.yaml')['empty_values'].each { |key, val| $test_settings[key] ||= val }
  end

  def run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions = [], expected_errors = [])
    @test = run_script_with_proc(['buff-watcher'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup
      $parsed_args = script_args.dup

      mocks = [fake_drc, fake_drci, fake_drca]

      original_DRC = BuffWatcher::DRC if defined?(BuffWatcher::DRC)
      BuffWatcher.send(:remove_const, "DRC") if defined?(BuffWatcher::DRC)
      BuffWatcher.const_set("DRC", fake_drc)

      original_DRCI = BuffWatcher::DRCI if defined?(BuffWatcher::DRCI)
      BuffWatcher.send(:remove_const, "DRCI") if defined?(BuffWatcher::DRCI)
      BuffWatcher.const_set("DRCI", fake_drci)

      original_DRCA = BuffWatcher::DRCA if defined?(BuffWatcher::DRCA)
      BuffWatcher.send(:remove_const, "DRCA") if defined?(BuffWatcher::DRCA)
      BuffWatcher.const_set("DRCA", fake_drca)

      # Test
      begin
        error = nil
        # If you need to let the script-under-test's infinite loop run
        # then provide a hook and you can stop the script when you need.
        # Otherwise, don't provide a hook and the script will run synchronously.
        if on_script_start_hook
          thread = Thread.new { BuffWatcher.new }
          on_script_start_hook.call(thread)
          thread.join
        else
          BuffWatcher.new
        end
      rescue Exception => e
        error = e
        unless expected_errors.include?(error.class)
          flunk(exception_details(e, 'Unexpected error running test'))
        end
      end

      # Restore injected dependencies
      BuffWatcher.send(:remove_const, "DRC") if defined?(BuffWatcher::DRC)
      BuffWatcher.const_set("DRC", original_DRC)

      BuffWatcher.send(:remove_const, "DRCI") if defined?(BuffWatcher::DRCI)
      BuffWatcher.const_set("DRCI", original_DRCI)

      BuffWatcher.send(:remove_const, "DRCA") if defined?(BuffWatcher::DRCA)
      BuffWatcher.const_set("DRCA", original_DRCA)

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      mocks.each { |mock| assertions << proc { assert_mock(mock) } if mock.class == Minitest::Mock }
      assertions.each { |assertion| assertion.call(error) }
    end)
  end

  def test_should_exit_if_no_buff_set_defined
    $test_settings.waggle_sets = {
      'buffy' => [
        'Super Power'
      ]
    }

    script_args = {}

    messages = []

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    on_script_start_hook = nil

    assertions = [
      assert_displayed_messages_include_any(["No spells defined in buff set 'default'.  Ending script.  Double check your settings."]),
      assert_raise_error(SystemExit, 'exit')
    ]

    expected_errors = [
      SystemExit
    ]

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_not_buff_if_hidden
    $test_settings.waggle_sets = {
      'buffy' => [
        'Super Power'
      ]
    }

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Thief'
    $hidden = true
    $invisible = false

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # nothing extra needed, when the mocks are verified that'll confirm
      # that the script never got to spots that called them
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_not_buff_if_invisible
    $test_settings.waggle_sets = {
      'buffy' => [
        'Super Power'
      ]
    }

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Thief'
    $hidden = false
    $invisible = true

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # nothing extra needed, when the mocks are verified that'll confirm
      # that the script never got to spots that called them
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_not_buff_if_running_no_use_scripts
    $test_settings.waggle_sets = {
      'buffy' => [
        'Super Power'
      ]
    }

    $test_settings.buff_watcher_no_use_scripts = ['burgle']

    $running_scripts += $test_settings.buff_watcher_no_use_scripts

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Thief'
    $hidden = false
    $invisible = false

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # nothing extra needed, when the mocks are verified that'll confirm
      # that the script never got to spots that called them
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_not_buff_if_inside_no_use_room
    $test_settings.waggle_sets = {
      'buffy' => [
        'Super Power'
      ]
    }

    $test_settings.buff_watcher_no_use_rooms = [Room.current.id]

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Thief'
    $hidden = false
    $invisible = false

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # nothing extra needed, when the mocks are verified that'll confirm
      # that the script never got to spots that called them
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_not_buff_if_need_inner_fire
    $test_settings.waggle_sets = {
      'buffy' => [
        'Super Power'
      ]
    }

    $test_settings.barb_buffs_inner_fire_threshold = 15

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Barbarian'
    DRStats.mana = 5
    $hidden = false
    $invisible = false

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # nothing extra needed, when the mocks are verified that'll confirm
      # that the script never got to spots that called them
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_not_buff_if_all_buffs_active
    $test_settings.waggle_sets = {
      'buffy' => {
        'Manifest Force' => {
          'mana' => 5
        }
      }
    }

    script_args = {
      'buff_set_name' => 'buffy'
    }

    DRSpells._set_active_spells({
      'Manifest Force' => true
    })

    messages = []

    DRStats.guild = 'Empath'
    $hidden = false
    $invisible = false

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # nothing extra needed, when the mocks are verified that'll confirm
      # that the script never got to spots that called them
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_activate_thief_khri
    $test_settings.waggle_sets = {
      'buffy' => [
        'Focus'
      ]
    }

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Thief'

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    do_buffs_count = 0
    fake_drca.expect(:do_buffs, true) do |arg_settings, arg_buff_set_name|
      case arg_buff_set_name
      when 'buffy'
        DRSpells._set_active_spells({
          'Khri Focus' => true
        })
        do_buffs_count = do_buffs_count + 1
        true
      else
        false
      end
    end

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # Assert the buff is activated once, and not again if still active.
      proc { assert_equal(1, do_buffs_count) }
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_activate_barbarian_ability
    $test_settings.waggle_sets = {
      'buffy' => [
        'Avalanche'
      ]
    }

    $test_settings.barb_buffs_inner_fire_threshold = 15

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Barbarian'
    DRStats.mana = 30

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    do_buffs_count = 0
    fake_drca.expect(:do_buffs, true) do |arg_settings, arg_buff_set_name|
      case arg_buff_set_name
      when 'buffy'
        DRSpells._set_active_spells({
          'Avalanche' => true
        })
        do_buffs_count = do_buffs_count + 1
        true
      else
        false
      end
    end

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # Assert the buff is activated once, and not again if still active.
      proc { assert_equal(1, do_buffs_count) }
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_cast_spell_buff
    $test_settings.waggle_sets = {
      'buffy' => {
        'Manifest Force' => {
          'mana' => 5
        }
      }
    }

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Empath'

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    do_buffs_count = 0
    fake_drca.expect(:do_buffs, true) do |arg_settings, arg_buff_set_name|
      case arg_buff_set_name
      when 'buffy'
        DRSpells._set_active_spells({
          'Manifest Force' => true
        })
        do_buffs_count = do_buffs_count + 1
        true
      else
        false
      end
    end

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # Assert the buff is activated once, and not again if still active.
      proc { assert_equal(1, do_buffs_count) }
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_free_hands_to_use_stored_cambrinth__scenario_1
    $test_settings.waggle_sets = {
      'buffy' => {
        'Manifest Force' => {
          'mana' => 5
        }
      }
    }

    $test_settings.stored_cambrinth = true

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Empath'
    self.left_hand = 'backpack'
    self.right_hand = 'basket'

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    do_buffs_count = 0
    fake_drca.expect(:do_buffs, true) do |arg_settings, arg_buff_set_name|
      case arg_buff_set_name
      when 'buffy'
        DRSpells._set_active_spells({
          'Manifest Force' => true
        })
        do_buffs_count = do_buffs_count + 1
        true
      else
        false
      end
    end

    fake_drci.expect(:lower_item?, true, ['backpack'])
    fake_drci.expect(:get_item?, true, ['backpack'])

    fake_drc.expect(:bput, "You glance down to see a reed-woven basket in your right hand and a rugged yellow backpack in your left hand.", ['glance', /You glance down .*/])

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # Assert the buff is activated once, and not again if still active.
      proc { assert_equal(1, do_buffs_count) }
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

  def test_should_free_hands_to_use_stored_cambrinth__scenario_2
    $test_settings.waggle_sets = {
      'buffy' => {
        'Manifest Force' => {
          'mana' => 5
        }
      }
    }

    $test_settings.cambrinth_items = [
      {
        'name' => 'cambrinth armband',
        'cap' => 32,
        'stored' => true
      }
    ]

    script_args = {
      'buff_set_name' => 'buffy'
    }

    messages = []

    DRStats.guild = 'Empath'
    self.left_hand = nil
    self.right_hand = 'basket'

    fake_drc = Minitest::Mock.new
    fake_drci = Minitest::Mock.new
    fake_drca = Minitest::Mock.new

    do_buffs_count = 0
    fake_drca.expect(:do_buffs, true) do |arg_settings, arg_buff_set_name|
      case arg_buff_set_name
      when 'buffy'
        DRSpells._set_active_spells({
          'Manifest Force' => true
        })
        do_buffs_count = do_buffs_count + 1
        true
      else
        false
      end
    end

    fake_drc.expect(:bput, "You glance down to see a reed-woven basket in your right hand and nothing in your left hand.", ['glance', /You glance down .*/])

    on_script_start_hook = proc do |thread|
      # Let the buff watcher's passive loop run a bit then kill the script.
      sleep 0.2
      Thread.kill(thread)
    end

    assertions = [
      # Assert the buff is activated once, and not again if still active.
      proc { assert_equal(1, do_buffs_count) }
    ]

    expected_errors = []

    run_buff_watcher(messages, script_args, fake_drc, fake_drci, fake_drca, on_script_start_hook, assertions, expected_errors)
  end

end