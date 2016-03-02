module Harness
  class Script
    def gets?
      ''
    end
  end

  def script
    Script.new
  end

  def custom_require(*); end

  def pause(*); end

  def echo(message)
    print(message.to_s + "\n") if $audible
    displayed_messages << message
  end

  def respond(message = '')
    print(message.to_s + "\n") if $audible
    displayed_messages << message
  end

  def displayed_messages
    $displayed_messages ||= []
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

  def get
    get?
  end

  def clear; end

  def get_character_setting
    $character_setting
  end

  def save_character_profile(data)
    $save_character_profile = data
  end

  def run_script(script)
    thread = Thread.new do
      script = "#{script}.lic" unless script.end_with?('.lic')
      load script
    end
    $threads ||= []
    $threads << thread
    thread
  end

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
