require_relative 'test_helper'
require 'timecop'

load 'test/test_harness.rb'

include Harness

class TestCommon < Minitest::Test

  def setup
    reset_data
  end

  def teardown
    @test.join if @test
  end

  def test_bput_sends_message
    @test = run_script_with_proc('common', proc do
      DRC.bput('a test message', 'some results')
    end)

    assert_sends_messages ['a test message']
  end

  def test_bput_returns_a_match
    $history = ['A result string']

    @test = run_script_with_proc('common', proc do
      assert_equal 'result', DRC.bput('a test message', 'result')
    end)
  end

  def test_bput_returns_a_match_with_other_data
    $history = [nil, 'not the correct string', '', 'A result string']

    @test = run_script_with_proc('common', proc do
      assert_equal 'result', DRC.bput('a test message', 'result')
    end)
  end

  def test_bput_returns_error_code_after_timeout
    $history = [nil, 'not the correct string', '']

    @test = run_script_with_proc('common', proc do
      start = Time.now
      assert_equal '', DRC.bput('a test message', 'result')
      Thread.current.thread_variable_set('runtime', Time.now - start)
    end)

    Timecop.scale(30)
    sleep 0.1 until @test.thread_variable_get('runtime')
    Timecop.return
    assert_in_delta 15, @test.thread_variable_get('runtime'), 1.0
  end

  def test_bput_delays_timeout_for_wait
    $history = [nil, 'not the correct string', '']

    @test = run_script_with_proc('common', proc do
      assert_equal 'result', DRC.bput('a test message', 'result')
    end)

    $history << '...wait 9'
    $history << 'result'

    sleep 0.25

    assert_equal 8.1, $pause
  end

  def test_bput_not_suppresses_no_match_message
    $history = [nil, 'not the correct string', '']
    timeout = 0.1

    @test = run_script_with_proc('common', proc do
      DRC.bput('a test message', { 'timeout' => timeout, 'suppress_no_match' => false }, 'result')
    end)

    @test.join # wait for bput to timeout and finish

    assert_includes($displayed_messages, "*** No match was found after #{timeout} seconds, dumping info")
  end

  def test_bput_suppresses_no_match_message
    $history = [nil, 'not the correct string', '']
    timeout = 0.1

    @test = run_script_with_proc('common', proc do
      DRC.bput('a test message', { 'timeout' => timeout, 'suppress_no_match' => true }, 'result')
    end)

    @test.join # wait for bput to timeout and finish

    refute_includes($displayed_messages, "*** No match was found after #{timeout} seconds, dumping info")
  end

  def test_bput_displays_debug_info
    $history = [nil, 'not the correct string', '']

    @test = run_script_with_proc('common', proc do
      DRC.bput('a test message', { 'debug' => true }, 'result')
    end)

    $history << 'result'

    @test.join # wait for bput to timeout and finish

    assert_includes($displayed_messages, 'bput.message=a test message')
    assert_includes($displayed_messages, 'bput.options={"debug"=>true, "timeout"=>15}')
    assert_includes($displayed_messages, 'bput.matches=["result"]')
  end

  def test_bput_not_displays_debug_info
    $history = [nil, 'not the correct string', '']

    @test = run_script_with_proc('common', proc do
      DRC.bput('a test message', { 'debug' => false }, 'result')
    end)

    $history << 'result'

    @test.join # wait for bput to timeout and finish

    refute_includes($displayed_messages, 'bput.message=a test message')
    refute_includes($displayed_messages, 'bput.options={"debug"=>false, "timeout"=>15}')
    refute_includes($displayed_messages, 'bput.matches=["result"]')
  end

end
