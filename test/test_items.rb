require 'minitest/autorun'
load 'test/test_harness.rb'

class TestItems < Minitest::Test
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
      assert_equal(/\b#{'sword'}\b/i, actual.short_regex)
    end)
  end

  def test_short_regex
    @test = run_script_with_proc('common', proc do
      actual = DRC::Item.new(name: 'sword', adjective: 'steel')
      assert_equal(/\b#{'steel'}.*\b#{'sword'}\b/i, actual.short_regex)
    end)
  end
end
