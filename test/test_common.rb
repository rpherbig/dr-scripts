require 'minitest/autorun'
require 'timecop'

module UserVars
  def self.trash_storage=(_val)
  end
end

module Harness2
  class Script
    def gets?
      ''
    end
  end

  def script
    Script.new
  end

  def pause(*); end

  def echo(message)
    # puts message
  end

  def checkdead
    $dead || false
  end

  def checkhealth
    $health || 100
  end

  def fput(message)
    sent_messages << message
  end

  def put(message)
    sent_messages << message
  end

  def sent_messages
    $sent_messages ||= Queue.new
  end

  def health=(health)
    $health = health
  end

  def dead=(dead)
    $dead = dead
  end

  def waitrt?; end

  def get?
    $history ? $history.shift : nil
  end

  def clear; end

  def run_script_with_proc(script, test)
    # Thread.abort_on_exception=true
    thread = Thread.new do
      script = "#{script}.lic" unless script.end_with?('.lic')
      load script
      test.call
    end
    $threads ||= []
    $threads << thread
    thread
  end

  def assert_sends_messages(expected_messages)
    expected_messages = expected_messages.clone

    consumer = Thread.new do
      loop do
        message = sent_messages.pop

        if message == expected_messages.first
          expected_messages.pop
          if expected_messages.any?
            next
          else
            break
          end
        end

        sleep 0.1
      end
    end

    10.times do |_|
      sleep 0.1 if consumer.alive?
    end

    $threads.last.kill
    assert_empty expected_messages, "Expected script to send #{expected_messages}"
  end
end

include Harness2
include UserVars

class TestCommon < Minitest::Test
  def setup
    sent_messages.clear
    @result = nil
  end

  def teardown
    @test.join if @test
  end

  def test_bput_sends_message
    @test = run_script_with_proc('common', proc do
      DRC.bput('a test message')
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
      assert_equal $FAILED_COMMAND, DRC.bput('a test message', 'result')
      Thread.current.thread_variable_set('runtime', Time.now - start)
    end)

    Timecop.scale(30)
    sleep 1
    Timecop.return
    assert_in_delta 15, @test.thread_variable_get('runtime'), 0.1
  end

  def test_bput_delays_timeout_for_wait
    $history = [nil, 'not the correct string', '']

    @test = run_script_with_proc('common', proc do
      start = Time.now
      assert_equal $FAILED_COMMAND, DRC.bput('a test message', 'result')
      Thread.current.thread_variable_set('runtime', Time.now - start)
    end)

    sleep 1
    $history << '...wait 9 seconds'
    Timecop.scale(30)
    sleep 1
    Timecop.return
    assert_in_delta 16, @test.thread_variable_get('runtime'), 0.1
  end
end
