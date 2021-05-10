require_relative 'test_helper'

load 'test/test_harness.rb'

include Harness

class TestDRCI < Minitest::Test
  def setup
    reset_data
    $history.clear
    $server_buffer.clear
    sent_messages.clear
    displayed_messages.clear
  end

  def teardown
    @test.join if @test
  end

  #########################################
  # GIVE ITEM
  #########################################

  def assert_give_item_success
    proc { |accepted| assert_equal(true, accepted) }
  end

  def assert_give_item_failure
    proc { |accepted| assert_equal(false, accepted) }
  end

  def run_give_item(messages, assertions = [])
    @test = run_script_with_proc(['common', 'common-items'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup

      # Test
      accepted = DRCI.give_item?('Frodo', 'ring')

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(accepted) }
    end)
  end

  def test_give_item_accepts_offer
    messages = [
      'You offer your magic ring to Frodo, who has 30 seconds to accept the offer.  Type CANCEL to prematurely cancel the offer.',
      'Frodo has accepted your offer and is now holding a magical ring to rule them all.'
    ]
    run_give_item(messages, [
      assert_give_item_success
    ])
  end

  def test_give_item_offer_declined
    messages = [
      'You offer your magic ring to Frodo, who has 30 seconds to accept the offer.  Type CANCEL to prematurely cancel the offer.',
      'Frodo has declined the offer.'
    ]
    run_give_item(messages, [
      assert_give_item_failure
    ])
  end

  def test_give_item_offer_expires
    messages = [
      'You offer your magic ring to Frodo, who has 30 seconds to accept the offer.  Type CANCEL to prematurely cancel the offer.',
      'Your offer to Frodo has expired.'
    ]
    run_give_item(messages, [
      assert_give_item_failure
    ])
  end

  def test_give_item_multiple_outstanding_offers
    messages = [
      'You may only have one outstanding offer at a time.'
    ]
    run_give_item(messages, [
      assert_give_item_failure
    ])
  end

  def test_give_item_nothing_to_give
    messages = [
      "What is it you're trying to give"
    ]
    run_give_item(messages, [
      assert_give_item_failure
    ])
  end

  #########################################
  # ACCEPT ITEM
  #########################################

  def assert_accept_item_success
    proc { |giver| assert_equal('Frodo', giver) }
  end

  def assert_accept_item_failure
    proc { |giver| assert_equal(false, giver) }
  end

  def run_accept_item(messages, assertions = [])
    @test = run_script_with_proc(['common', 'common-items'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup

      # Test
      giver = DRCI.accept_item?

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(giver) }
    end)
  end

  def test_accept_item_accepted
    messages = [
      "Frodo offers you a magical ring.  Enter ACCEPT to accept the offer or DECLINE to decline it.  The offer will expire in 30 seconds.",
      "You accept Frodo's offer and are now holding a magical ring."
    ]
    run_accept_item(messages, [
      assert_accept_item_success
    ])
  end

  def test_accept_item_no_offers
    messages = [
      "You have no offers to accept."
    ]
    run_accept_item(messages, [
      assert_accept_item_failure
    ])
  end

  def test_accept_item_hands_full
    messages = [
      "Frodo offers you a magical ring.  Enter ACCEPT to accept the offer or DECLINE to decline it.  The offer will expire in 30 seconds.",
      "Both of your hands are full."
    ]
    run_accept_item(messages, [
      assert_accept_item_failure
    ])
  end

  def test_accept_item_inventory_limit
    messages = [
      "Frodo offers you a magical ring.  Enter ACCEPT to accept the offer or DECLINE to decline it.  The offer will expire in 30 seconds.",
      "Accepting a magical ring would push you over your item limit of 100 items.  Please reduce your inventory count before you try again."
    ]
    run_accept_item(messages, [
      assert_accept_item_failure
    ])
  end

end
