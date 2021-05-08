module Harness
  # Lich global for the last time a user sent a command to the game
  $_IDLETIMESTAMP_ = Time.now
  # Lich global for the last time a script sent a command to the game
  $_SCRIPTIDLETIMESTAMP_ = Time.now

  class DRSpells
    @@_data_store = {}

    def self._reset
      @@_data_store = {}
    end

    def self._set_active_spells(val)
      @@_data_store['active_spells'] = val
    end

    def self.active_spells
      @@_data_store['active_spells'] || {}
    end
  end

  class DRStats
    @@_data_store = {}

    def self._reset
      @@_data_store = {}
    end

    def self._set_guild(val)
      @@_data_store['guild'] = val
    end

    def self.guild
      @@_data_store['guild'] || 'Ranger'
    end
  end

  class DRSkill
    @@_data_store = {}

    def self._reset
      @@_data_store = {}
    end

    def self._set_rank(skillname, val)
      @@_data_store[skillname] = val
    end

    def self.getrank(skillname)
      @@_data_store[skillname] || 100
    end
  end

  class Flags
    @@flags = {}
    @@matchers = {}

    def self.[](key)
      @@flags[key]
    end

    def self.[]=(key, value)
      @@flags[key] = value
    end

    def self.add(key, *matchers)
      @@flags[key] = false
      @@matchers[key] = matchers.map { |item| item.is_a?(Regexp) ? item : /#{item}/i }
    end

    def self.reset(key)
      @@flags[key] = false
    end

    def self.delete(key)
      @@matchers.delete key
      @@flags.delete key
    end

    def self.flags
      @@flags
    end

    def self.matchers
      @@matchers
    end
  end

  class Script
    def gets?
      get?
    end

    def gets
      get?
    end

    def self.at_exit(&_block); end
  end

  class UpstreamHook
    def self.add(*); end

    def self.remove(*); end
  end

  class DownstreamHook
    def self.add(*); end

    def self.remove(*); end
  end

  def before_dying(&code)
    Script.at_exit(&code)
  end

  def script
    Script.new
  end

  def custom_require(*)
    proc { |_args| }
  end

  def pause(duration = 1)
    $pause = duration
  end

  def parse_args(_dummy, _dumber)
    args = OpenStruct.new
    args.flex = 'test'
    args
  end

  def get_settings(dummy = nil)
    $settings_called_with = dummy
    $test_settings
  end

  def get_data(dummy)
    $data_called_with << dummy
    $test_data[dummy.to_sym]
  end

  def reset_data
    $data_called_with = []
    $test_data = {}
  end

  def echo(message)
    print(message.to_s + "\n") if $audible
    displayed_messages << message
    if message =~ /^WARNING:/
      $warn_msgs << message
    elsif message =~ /^ERROR:/
      $error_msgs << message
    end
  end

  def respond(message = '')
    print(message.to_s + "\n") if $audible
    displayed_messages << message
  end

  def displayed_messages
    $displayed_messages ||= []
  end

  def dead?
    $dead || false
  end

  def health
    $health || 100
  end

  def spirit
    $spirit || 100
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

  def spirit=(spirit)
    $spirit = spirit
  end

  def dead=(dead)
    $dead = dead
  end

  def waitrt?; end

  def waitcastrt?; end

  def get?
    $history ? $history.shift : nil
  end

  alias get get?

  def reget(*lines)
    lines.flatten!
    history = $server_buffer.dup.join("\n")
    history.gsub!(/<pushStream id=["'](?:spellfront|inv|bounty|society)["'][^>]*\/>.*?<popStream[^>]*>/m, '')
    history.gsub!(/<stream id="Spells">.*?<\/stream>/m, '')
    history.gsub!(/<(compDef|inv|component|right|left|spell|prompt)[^>]*>.*?<\/\1>/m, '')
    history.gsub!(/<[^>]+>/, '')
    history.gsub!('&gt;', '>')
    history.gsub!('&lt;', '<')
    history = history.split("\n").delete_if { |line| line.nil? || line.empty? || line =~ /^[\r\n\s\t]*$/ }
    if lines.first.is_a?(Numeric) || lines.first.to_i.nonzero?
      history = history[-[lines.shift.to_i, history.length].min..-1]
    end
    unless lines.empty? || lines.nil?
      regex = /#{lines.join('|')}/i
      history = history.find_all { |line| line =~ regex }
    end
    if history.empty?
      nil
    else
      history
    end
  end

  def no_pause_all; end

  def no_kill_all; end

  def setpriority(*); end

  def register_slackbot(username); end

  def send_slackbot_message(message); end

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

  def run_script_with_proc(scripts, test)
    thread = Thread.new do
      scripts = [scripts] unless scripts.is_a?(Array)
      scripts.each do |script|
        # To collect code coverage with the simplecov gem
        # then the scripts MUST be launched via `require_relative` command.
        # To be launched via `require_relative` command
        # then the scripts MUST use the `.rb` extension.
        script = "tmp/#{script}.rb" unless script.end_with?('.rb')
        require_relative script
      end
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
        if $debug_message_assert
          puts "message  :  #{message}"
          puts "expected :#{expected_messages}"
        end
        expected_messages.delete_at(expected_messages.index(message) || expected_messages.length)
        break if expected_messages.empty?
        sleep 0.1
      end
    end

    10.times do |_|
      sleep 0.1 if consumer.alive?
    end

    $threads.last.kill if $threads

    $debug_message_assert = false
    assert_empty expected_messages, 'Expected script to send messages'
  end
end
