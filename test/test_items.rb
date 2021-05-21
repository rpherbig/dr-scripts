require_relative 'test_helper'

load 'test/test_harness.rb'

include Harness

class TestItems < Minitest::Test

  def setup
    reset_data
  end

  def teardown
    @test.join if @test
  end

  def test_short_name_with_no_adjective
    @test = run_script_with_proc('common', proc do
      actual = DRC::Item.new(name: 'sword')
      assert_equal 'sword', actual.short_name
    end)
  end

  def test_short_name
    @test = run_script_with_proc('common', proc do
      actual = DRC::Item.new(name: 'sword', adjective: 'steel')
      assert_equal 'steel.sword', actual.short_name
    end)
  end

  def test_short_regex_with_no_adjective
    @test = run_script_with_proc('common', proc do
      actual = DRC::Item.new(name: 'sword')
      assert_equal(/\b#{'sword'}/i, actual.short_regex)
    end)
  end

  def test_short_regex
    @test = run_script_with_proc('common', proc do
      actual = DRC::Item.new(name: 'sword', adjective: 'steel')
      assert_equal(/\b#{'steel'}.*\b#{'sword'}/i, actual.short_regex)
    end)
  end
end
