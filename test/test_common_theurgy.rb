require 'minitest/autorun'
load 'test/test_harness.rb'

include Harness

class TestCommonTheurgy < Minitest::Test
  def setup
    if defined?(DRCTH)
      Object.send(:remove_const, :DRCTH)
      $LOADED_FEATURES.delete_if {|file| file =~ /common/}
    end
    reset_data
    @fake_drc = Minitest::Mock.new
  end

  def teardown
    @test.join if @test
  end

  def assert_ready_to_commune
    proc { |commune_state| assert_equal(true, commune_state['commune_ready'], 'Incorrectly captured ready to commune flag as false') }
  end

  def assert_not_ready_to_commune
    proc { |commune_state| assert_equal(false, commune_state['commune_ready'], 'Incorrectly captured ready to commune flag as true') }
  end

  def assert_no_active_communes
    proc { |commune_state| assert_empty(commune_state['active_communes'], 'Incorrectly flagged communes as active.') }
  end

  def assert_active_commune(commune_name)
    proc { |commune_state| assert_equal(true, commune_state['active_communes'].include?(commune_name), "Missed active commune: #{commune_name}") }
  end

  def assert_no_recent_communes
    proc { |commune_state| assert_empty(commune_state['recent_communes'], 'Incorrectly flagged communes as recent.') }
  end

  def assert_recent_commune(commune_name)
    proc { |commune_state| assert_equal(true, commune_state['recent_communes'].include?(commune_name), "Missed recent commune: #{commune_name}") }
  end

  def run_commune_sense(messages, assertions = [])
    @test = run_script_with_proc(['common-theurgy'], proc do
      # Setup
      DRCTH.const_set("DRC", @fake_drc)
      $server_buffer = messages.dup
      $history = $server_buffer.dup
      @fake_drc.expect(:bput, 'Roundtime: 2 sec.', ['commune sense', String])

      # Test
      commune_state = DRCTH.commune_sense()

      #Assert
      @fake_drc.verify
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(commune_state) }
    end)
  end

  def test_commune_sense_1
    messages = [
      'Tamsine\'s benevolent eyes are upon you.',
      'You will not be able to open another divine conduit yet.',
      'You have been recently enlightened by Tamsine.',
      'Roundtime: 2 sec.'
    ]
    run_commune_sense(messages, [
      assert_not_ready_to_commune,
      assert_active_commune('Tamsine'),
      assert_recent_commune('Tamsine')
    ])
  end

  def test_commune_sense_2
    messages = [
      'The miracle of Tamsine has manifested about you.',
      'The waters of Eluned are still in your thoughts.',
      'You have been recently enlightened by Tamsine.',
      'Roundtime: 2 sec.'
    ]
    run_commune_sense(messages, [
      assert_ready_to_commune,
      assert_active_commune('Tamsine'),
      assert_recent_commune('Eluned'),
      assert_recent_commune('Tamsine')
    ])
  end

  def test_commune_sense_3
    messages = [
      'The miracle of Tamsine has manifested about you.',
      'You are under the auspices of Kertigen.',
      'You will not be able to open another divine conduit yet.',
      'The sounds of Kertigen\'s forge still ring in your ears.',
      'You have been recently enlightened by Tamsine.',
      'The waters of Eluned are still in your thoughts.',
      'Roundtime: 2 sec.'
    ]
    run_commune_sense(messages, [
      assert_not_ready_to_commune,
      assert_active_commune('Tamsine'),
      assert_active_commune('Kertigen'),
      assert_recent_commune('Tamsine'),
      assert_recent_commune('Eluned'),
      assert_recent_commune('Kertigen')
    ])
  end

  def test_commune_sense_4
    messages = [
      'You are not a vessel for the gods at present.',
      'You are still captivated by Truffenyi\'s favor.',
      'The waters of Eluned are still in your thoughts.',
      'Roundtime: 2 sec.'
    ]
    run_commune_sense(messages, [
      assert_ready_to_commune,
      assert_no_active_communes,
      assert_recent_commune('Truffenyi'),
      assert_recent_commune('Eluned')
    ])
  end

  def test_commune_sense_5
    messages = [
      'Meraud\'s influence is woven into the area.',
      'You are eager to better understand your relationship with the Immortals.',
      'Roundtime: 2 sec.'
    ]
    run_commune_sense(messages, [
      assert_ready_to_commune,
      assert_active_commune('Meraud'),
      assert_no_recent_communes
    ])
  end
end
