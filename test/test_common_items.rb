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
  # RUN DRCI COMMAND
  #########################################

  def assert_result
    proc { |result| assert(result) }
  end

  def refute_result
    proc { |result| refute(result) }
  end

  def run_drci_command(messages, command, args, assertions = [])
    @test = run_script_with_proc(['common', 'common-items'], proc do
      # Setup
      $server_buffer = messages.dup
      $history = $server_buffer.dup

      # Test
      result = DRCI.send(command, *args)

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(result) }
    end)
  end

  #########################################
  # GET ITEM
  #########################################

  def test_get_item_success
    command = 'get_item?'
    fixtures = [
      {
        :message => "You get a {{item}} from inside your hitman's backpack.",
        :item => "sanowret crystal"
      },
      {
        :message => "You pick up a {{item}}.",
        :item => "drake-fang arrow"
      },
      {
        :message => "You pluck an emaciated pet {{item}} from a coarse burlap sack, the creature yawning as you wake it up.",
        :item => "rat"
      },
      {
        :message => "You deftly remove the {{item}} from your sash.",
        :item => "spiky barb"
      },
      {
        :message => "You fade in for a moment as you pick up a {{item}} fit with a polished flamewood handle.",
        :item => "dainty cowbell"
      },
      {
        :message => "You fade in for a moment as you get a small rust-colored {{item}} from a black gem pouch.",
        :item => "andalusite"
      }
    ]
    fixtures.each do |fixture|
      run_drci_command(
        [fixture[:message].gsub('{{item}}', fixture[:item])],
        command,
        [fixture[:item]],
        [assert_result]
      ).join
    end
  end

  def test_get_item_failure
    command = 'get_item?'
    fixtures = [
      {
        :message => "But that is already in your inventory.",
        :item => "sanowret crystal"
      },
      {
        :message => "You need a free hand to do that.",
        :item => "drake-fang arrow"
      },
      {
        :message => "You need a free hand to pick that up.",
        :item => "rat"
      },
      {
        :message => "Picking up a rugged {{item}} would push you over the item limit of 100.  Please reduce your inventory count before you try again.",
        :item => "red backpack"
      },
      {
        :message => "You stop as you realize the {{item}} is not yours.",
        :item => "boar-tusk arrow"
      },
      {
        :message => "Get what?",
        :item => "anything"
      },
      {
        :message => "I could not find what you were referring to.",
        :item => "something"
      },
      {
        :message => "I could not find that container.",
        :item => "backpack"
      },
      {
        :message => "What were you referring to?",
        :item => "nothing"
      },
      {
        :message => "The large limb rapidly decays away.",
        :item => "limb"
      },
      {
        :message => "A sharp pine sapling cracks and rots away along with the troll.",
        :item => "sapling"
      }
    ]
    fixtures.each do |fixture|
      run_drci_command(
        [fixture[:message].gsub('{{item}}', fixture[:item])],
        command,
        [fixture[:item]],
        [refute_result]
      ).join
    end
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
