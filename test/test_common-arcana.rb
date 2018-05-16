require 'minitest/autorun'
load 'test/test_harness.rb'

include Harness

class TestDRCA < Minitest::Test

  def setup
    load 'common-arcana.lic'
    $history.clear
  end

  def test_find_visible_planets_while_indoors
    load 'common.lic'
    load 'events.lic'
    $history = [
        "You get an ivory telescope inlaid with a ruby-eyed golden dragon from inside your hunting pack.",
        "That's a bit tough to do when you can't see the sky.",
        "You put your telescope in your hunting pack."
    ]
    seen_planets = DRCA.find_visible_planets(['a planet', 'another planet'])
    assert_empty(seen_planets)
  end

end