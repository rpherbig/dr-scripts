require 'minitest/autorun'
load 'test/test_harness.rb'

class TestItems < Minitest::Test
  def setup
    load('common.lic')
  end

  def test_short_name_without_short_gear
    actual = DRC::Item.new(name: 'sword')
    assert_equal nil, actual.short_name
  end

  def test_short_name_with_no_adjective
    actual = DRC::Item.new(name: 'sword', short_gear: true)
    assert_equal 'sword', actual.short_name
  end

  def test_short_name
    actual = DRC::Item.new(name: 'sword', adjective: 'steel', short_gear: true)
    assert_equal 'steel.sword', actual.short_name
  end

  def test_short_regex_without_short_gear
    actual = DRC::Item.new(name: 'sword')
    assert_nil actual.short_regex
  end

  def test_short_regex_with_no_adjective
    actual = DRC::Item.new(name: 'sword', short_gear: true)
    assert_equal(/\b#{'sword'}/i, actual.short_regex)
  end

  def test_short_regex
    actual = DRC::Item.new(name: 'sword', adjective: 'steel', short_gear: true)
    assert_equal(/#{'steel'}.*\b#{'sword'}/i, actual.short_regex)
  end
end
