require_relative 'test_helper'

load 'test/test_harness.rb'

include Harness

class TestCheckHealth < Minitest::Test

  def setup
    reset_data
  end

  def teardown
    @test.join if @test
  end

  def assert_bleeding
    proc { |health| assert_equal(false, health['bleeders'].empty?, 'Person is bleeding but reported as not bleeding') }
  end

  def assert_wounded
    proc { |health| assert_equal(false, health['wounds'].empty?, 'Person is wounded but reported as not wounded') }
  end

  def assert_not_wounded
    proc { |health| assert_empty(health['wounds'], 'Person is not wounded but reported as wounded') }
  end

  def assert_poisoned
    proc { |health| assert_equal(true, health['poisoned'], 'Person is poisoned but reported as not poisoned') }
  end

  def assert_not_poisoned
    proc { |health| assert_equal(false, health['poisoned'], 'Person is not poisoned but reported as poisoned') }
  end

  def assert_diseased
    proc { |health| assert_equal(true, health['diseased'], 'Person is diseased but reported as not diseased') }
  end

  def assert_not_diseased
    proc { |health| assert_equal(false, health['diseased'], 'Person is not diseased but reported as diseased') }
  end

  def assert_no_parasites
    proc { |health| assert_empty(health['parasites'], 'Person parasite free but is reported as host to parasites') }
  end

  def assert_healthy
    [
      assert_not_wounded,
      assert_not_poisoned,
      assert_not_diseased,
      assert_no_parasites
    ]
  end

  def check_health_with_buffer(messages, assertions = [])
    $server_buffer = messages.dup
    $history = $server_buffer.dup
    @test = run_script_with_proc(['common', 'common-healing-data', 'common-healing'], proc do
      health_result = DRCH.check_health
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(health_result) }
    end)
  end

  def test_that_tail_is_bleeding
    messages = [
      'Your body feels slightly battered.',
      'Your spirit feels full of life.',
      'You have deep cuts across the tail.',
      'Bleeding',
      '            Area       Rate',
      '-----------------------------------------',
      '            tail       slight'
    ]
    check_health_with_buffer(messages, [assert_wounded, assert_bleeding])
  end

  def test_that_wounded_person_is_wounded
    messages = [
      'Your body feels at full strength.',
      'Your spirit feels full of life.',
      'You have some tiny scratches to the neck, minor swelling and bruising around the left arm compounded by cuts and bruises about the left arm, minor swelling and bruising around the right leg compounded by cuts and bruises about the right leg, minor swelling and bruising around the left leg compounded by cuts and bruises about the left leg, some minor abrasions to the left hand, some tiny scratches to the chest, some tiny scratches to the abdomen, some tiny scratches to the back, some minor abrasions to the right eye.',
      'You have no significant injuries.'
    ]
    check_health_with_buffer(messages, assert_wounded)
  end

  def test_that_healthy_person_is_healthy
    messages = [
      'Your body feels at full strength.',
      'Your spirit feels full of life.',
      'You have no significant injuries.'
    ]
    check_health_with_buffer(messages, assert_healthy)
  end

  def test_that_fatigue_line_does_not_interfere
    messages = [
      'Your body feels at full strength.',
      'You are slightly fatigued.',
      'Your spirit feels full of life.',
      'You have no significant injuries.'
    ]
    check_health_with_buffer(messages, assert_healthy)
  end

  def test_that_poisoned_person_is_poisoned
    messages = [
      'Your body feels at full strength.',
      'Your spirit feels full of life.',
      'You have some tiny scratches to the neck, minor swelling and bruising around the left arm compounded by cuts and bruises about the left arm, minor swelling and bruising around the right leg compounded by cuts and bruises about the right leg, minor swelling and bruising around the left leg compounded by cuts and bruises about the left leg, some minor abrasions to the left hand, some tiny scratches to the chest, some tiny scratches to the abdomen, some tiny scratches to the back, some minor abrasions to the right eye.',
      'You have a mildly poisoned right leg.'
    ]
    check_health_with_buffer(messages, [assert_no_parasites, assert_not_diseased, assert_poisoned, assert_wounded])
  end

  def test_that_wounded_person_is_healthy_after_healing
    messages = [
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
    check_health_with_buffer(messages, assert_healthy)
  end

  def test_that_diseased_person_is_diseased
    messages = [
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
    check_health_with_buffer(messages, [assert_diseased, assert_wounded])
  end

  def test_that_the_last_health_lines_are_used
    # Same as test_that_wounded_person_is_healthy_after_healing but with the Empath interaction lines removed and
    # all known vitality lines/messages checked against.
    ['Your body feels at full strength.',
     'Your body feels slightly battered.',
     'Your body feels battered.',
     'Your body feels beat up.',
     'Your body feels very beat up.',
     'Your body feels extremely beat up.',
     'Your body feels in bad shape.',
     'Your body feels in very bad shape!',
     'Your body feels in extremely bad shape!',
     'Your body feels at death\'s door!'].each do |vit_line|

      messages = [
        vit_line,
        'Your spirit feels full of life.',
        'You have some tiny scratches to the neck, minor swelling and bruising around the left arm compounded by cuts and bruises about the left arm, minor swelling and bruising around the right leg compounded by cuts and bruises about the right leg, minor swelling and bruising around the left leg compounded by cuts and bruises about the left leg, some minor abrasions to the left hand, some tiny scratches to the chest, some tiny scratches to the abdomen, some tiny scratches to the back, some minor abrasions to the right eye.',
        'You have no significant injuries.',
        vit_line,
        'Your spirit feels full of life.',
        'You have no significant injuries.'
      ]
      check_health_with_buffer(messages, assert_healthy)
      @test.join
    end
  end

end
