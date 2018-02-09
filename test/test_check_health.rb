require 'minitest/autorun'
load 'test/test_harness.rb'

include Harness

class TestCheckHealth < Minitest::Test
  def setup
    $server_buffer.clear
    $history.clear
    load('common.lic')
    load('common-healing.lic')
  end

  def assert_healthy(health)
    assert_empty(health['wounds'])
    assert_empty(health['parasites'])
    assert_equal(health['poisoned'], false)
    assert_equal(health['diseased'], false)
  end

  def test_that_healthy_person_is_healthy
    $server_buffer = [
        'Your body feels at full strength.',
        'Your spirit feels full of life.',
        'You have no significant injuries.'
    ]
    $history = $server_buffer.dup
    assert_healthy(DRCH.check_health)
  end

  def test_that_fatigue_line_does_not_interfere
    $server_buffer = [
        'Your body feels at full strength.',
        'You are slightly fatigued.',
        'Your spirit feels full of life.',
        'You have no significant injuries.'
    ]
    $history = $server_buffer.dup
    assert_healthy(DRCH.check_health)
  end

  def test_that_poisoned_person_is_poisoned
    $server_buffer = [
        'Your body feels at full strength.',
        'Your spirit feels full of life.',
        'You have some tiny scratches to the neck, minor swelling and bruising around the left arm compounded by cuts and bruises about the left arm, minor swelling and bruising around the right leg compounded by cuts and bruises about the right leg, minor swelling and bruising around the left leg compounded by cuts and bruises about the left leg, some minor abrasions to the left hand, some tiny scratches to the chest, some tiny scratches to the abdomen, some tiny scratches to the back, some minor abrasions to the right eye.',
        'You have a mildly poisoned right leg.'
    ]
    $history = $server_buffer.dup
    health = DRCH.check_health
    assert_empty(health['parasites'])
    assert_equal(health['diseased'], false)
    assert_equal(health['poisoned'],true)
    assert_equal(health['wounds'].empty?, false)
  end

  def test_that_wounded_person_is_healthy_after_healing
    $server_buffer = [
        'Your body feels at full strength.',
        'Your spirit feels full of life.',
        'You have some tiny scratches to the neck, minor swelling and bruising around the left arm compounded by cuts and bruises about the left arm, minor swelling and bruising around the right leg compounded by cuts and bruises about the right leg, minor swelling and bruising around the left leg compounded by cuts and bruises about the left leg, some minor abrasions to the left hand, some tiny scratches to the chest, some tiny scratches to the abdomen, some tiny scratches to the back, some minor abrasions to the right eye.',
        'You have no significant injuries.',
        'Empath touches you.',
        'You feel a warmth radiate from Empath\'s touch.',
        'You have a brief sensation that leaves your wounds tingling.',
        'Your external left leg and chest wounds feel fully healed.',
        'Your internal left leg and chest wounds feel fully healed.',
        'Your external left leg and chest scars feel fully healed.',
        'Your internal left leg and chest scars feel fully healed.',
        'Empath whispers, "Done!"',
        'Your body feels at full strength.',
        'Your spirit feels full of life.',
        'You have no significant injuries.'
    ]
    $history = $server_buffer.dup
    assert_healthy(DRCH.check_health)
  end

  def test_that_diseased_person_is_diseased
    $server_buffer = [
        'Your body feels beat up.',
        'Your spirit feels full of life.',
        'You have some minor abrasions to the right arm, a broken right hand with gaping holes, deep slashes across the chest area.',
        'Bleeding',
        '            Area       Rate',
        '-----------------------------------------',
        '      right hand       moderate',
        '           chest       moderate',
        'Your body is covered in open oozing sores.'
    ]
    $history = $server_buffer.dup
    health = DRCH.check_health
    assert_equal(true, health['diseased'], 'Person is diseased but reported as not diseased')
  end
end
