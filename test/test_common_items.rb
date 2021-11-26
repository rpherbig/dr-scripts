require_relative 'test_helper'
require 'timecop'
require 'yaml'

load 'test/test_harness.rb'

include Harness

class TestDRCI < Minitest::Test

  def setup
    if defined?(DRCI)
      Object.send(:remove_const, :DRCI)
      $LOADED_FEATURES.delete_if {|file| file =~ /common/}
    end
    reset_data
    @fake_drc = Minitest::Mock.new
  end

  def teardown
    @test.join if @test
  end

  def load_base_settings(settings = {})
    test_settings = OpenStruct.new(YAML.load_file('profiles/base.yaml').merge(settings))
    YAML.load_file('profiles/base-empty.yaml')['empty_values'].each { |key, val| test_settings[key] ||= val }
    test_settings
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
      Timecop.scale(30) # artificially speed up bput's timeout
      result = DRCI.send(command, *args)
      Timecop.return

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(result) }
    end)
  end

  #########################################
  # WEAR ITEM
  #########################################

  def test_wear_item__you_toss_one_strap
    run_drci_command(
      ["You toss one strap of the harness over your shoulder, pull it down and buckle it to its mate."],
      'wear_item?',
      ["weapon harness"],
      [assert_result]
    )
  end

  def test_wear_item__you_tug
    run_drci_command(
      ["You tug on the chain gloves, flexing your hand as you pull them on for a snug fit."],
      'wear_item?',
      ["chain gloves"],
      [assert_result]
    )
  end

  def test_wear_item__you_pull
    run_drci_command(
      ["You pull the chain balaclava over your head, tugging at the links to smooth them into optimal coverage."],
      'wear_item?',
      ["chain balaclava"],
      [assert_result]
    )
  end

  #########################################
  # GET ITEM
  #########################################

  def test_get_item__should_look_in_eddy_portal_then_get_branch_from_portal
    run_drci_command(
      [
        # Don't see it the first time, so the script will need to look in the portal
        "What were you referring to?",
        # You look in the portal
        "In the swirling eddy you see a bloodwood branch.",
        # The retry attempt now gets the item
        "You get a bloodwood branch from inside a swirling eddy of incandescent light bound by a gold-striated coralite frame."
      ],
      'get_item?',
      ["bloodwood branch", "watery portal"],
      [assert_result]
    )
  end

  def test_get_item__should_open_eddy_then_look_in_portal_then_get_branch_from_portal
    run_drci_command(
      [
        # Don't see it the first time, so the script will need to open the eddy then look in it
        "What were you referring to?",
        # You open the eddy
        "You open your swirling eddy.",
        # You look in the portal
        "In the swirling eddy you see a bloodwood branch.",
        # The retry attempt now gets the item
        "You get a bloodwood branch from inside a swirling eddy of incandescent light bound by a gold-striated coralite frame."
      ],
      'get_item?',
      ["bloodwood branch", "watery portal"],
      [assert_result]
    )
  end

  def test_get_item__should_get_crystal_from_backpack
    run_drci_command(
      ["You get a sanowret crystal from inside your hitman's backpack."],
      'get_item?',
      ["sanowret crystal"],
      [assert_result]
    )
  end

  def test_get_item__should_pick_up_arrow
    run_drci_command(
      ["You pick up a drake-fang arrow."],
      'get_item?',
      ["drake-fang arrow"],
      [assert_result]
    )
  end

  def test_get_item__should_pluck_rat_from_sack
    run_drci_command(
      ["You pluck an emaciated pet rat from a coarse burlap sack, the creature yawning as you wake it up."],
      'get_item?',
      ["rat"],
      [assert_result]
    )
  end

  def test_get_item__should_remove_barb_from_sash
    run_drci_command(
      ["You deftly remove the spiky barb from your sash."],
      'get_item?',
      ["spiky barb"],
      [assert_result]
    )
  end

  def test_get_item__should_fade_in_to_pick_up_cowbell
    run_drci_command(
      ["You fade in for a moment as you pick up a dainty cowbell fit with a polished flamewood handle."],
      'get_item?',
      ["dainty cowbell"],
      [assert_result]
    )
  end

  def test_get_item__should_fade_in_to_get_gem_from_pouch
    run_drci_command(
      ["You fade in for a moment as you get a small rust-colored andalusite from a black gem pouch."],
      'get_item?',
      ["andalusite"],
      [assert_result]
    )
  end

  def test_get_item__should_stop_as_you_realize_not_yours
    run_drci_command(
      ["You stop as you realize the boar-tusk arrow is not yours."],
      'get_item?',
      ["boar-tusk arrow"],
      [refute_result]
    )
  end

  def test_get_item__should_not_exceed_inventory_limit
    run_drci_command(
      ["Picking up a rugged red backpack would push you over the item limit of 100.  Please reduce your inventory count before you try again."],
      'get_item?',
      ["red backpack"],
      [refute_result]
    )
  end

  def test_get_item__should_need_a_free_hand_to_pick
    run_drci_command(
      ["You need a free hand to pick that up."],
      'get_item?',
      ["anything"],
      [refute_result]
    )
  end

  def test_get_item__should_need_a_free_hand_to_do
    run_drci_command(
      ["You need a free hand to do that."],
      'get_item?',
      ["anything"],
      [refute_result]
    )
  end

  def test_get_item__should_not_pick_up_with_damaged_hand
    run_drci_command(
      ["You can't pick that up with your hand that damaged."],
      'get_item?',
      ["anything"],
      [refute_result]
    )
  end

  def test_get_item__should_not_get_with_injured_hand
    run_drci_command(
      ["Your right hand is too injured to do that."],
      'get_item?',
      ["anything"],
      [refute_result]
    )
  end

  def test_get_item__should_need_to_tend_wound
    run_drci_command(
      ["The crossbow bolt needs to be tended to be removed."],
      'get_item?',
      ["crossbow bolt"],
      [refute_result]
    )
  end

  def test_get_item__should_already_be_in_your_inventory
    run_drci_command(
      ["But that is already in your inventory."],
      'get_item?',
      ["anything"],
      [refute_result]
    )
  end

  def test_get_item__should_ask_get_what
    run_drci_command(
      ["Get what?"],
      'get_item?',
      ["nothing"],
      [refute_result]
    )
  end

  def test_get_item__should_not_find_what_you_were_referring
    run_drci_command(
      ["I could not find what you were referring to."],
      'get_item?',
      ["nothing"],
      [refute_result]
    )
  end

  def test_get_item__should_ask_what_were_you_referring
    run_drci_command(
      ["What were you referring to?"],
      'get_item?',
      ["nothing"],
      [refute_result]
    )
  end

  def test_get_item__should_not_find_container
    run_drci_command(
      ["I could not find that container."],
      'get_item?',
      ["nothing"],
      [refute_result]
    )
  end

  def test_get_item__should_not_get_if_rapidly_decays
    run_drci_command(
      ["The large limb rapidly decays away."],
      'get_item?',
      ["large limb"],
      [refute_result]
    )
  end

  def test_get_item__should_not_get_if_rots_away
    run_drci_command(
      ["A sharp pine sapling cracks and rots away along with the troll."],
      'get_item?',
      ["large limb"],
      [refute_result]
    )
  end

  #########################################
  # PUT AWAY ITEM
  #########################################

  def test_put_away_item__you_put
    run_drci_command(
      ["You put your arrow in your thigh quiver."],
      'put_away_item?',
      ["arrow", "quiver"],
      [assert_result]
    )
  end

  def test_put_away_item__you_tuck_your
    run_drci_command(
      ["You tuck your jaguar-spotted kitten safely into its comfortable cat cottage."],
      'put_away_item?',
      ["kitten", ["cottage", "home"]],
      [assert_result]
    )
  end

  def test_put_away_item__you_tuck_a
    run_drci_command(
      ["You tuck a blue-black Adan'f-scaled spellbook into the spellbook compartment of your diacan case."],
      'put_away_item?',
      ["spellbook", "case"],
      [assert_result]
    )
  end

  def test_put_away_item__you_open_your_hand
    run_drci_command(
      ["As you open your hand to release the moonblade, it is consumed in a cold blue-white fire."],
      'put_away_item?',
      ["moonblade"],
      [assert_result]
    )
  end

  def test_put_away_item__drop_in_bin
    run_drci_command(
      ["A bored-looking Human boy nods toward you as your silvered rapier falls into the azurite bin."],
      'put_away_item_unsafe?',
      ["rapier", "bin"],
      [assert_result]
    )
  end

  def test_put_away_item__open_closed_container
    run_drci_command(
      [
        "There isn't any more room in the backpack for that.",
        "That is closed.",
        "You open the cat cottage.",
        "You tuck your jaguar-spotted kitten safely into its comfortable cat cottage."
      ],
      'put_away_item?',
      ["kitten", ["backpack", "cottage"]],
      [assert_result]
    )
  end

  def test_put_away_item__open_closed_vault
    run_drci_command(
      [
        "That is closed.",
        "The vault opens.",
        "You put your bundle in the secure vault."
      ],
      'put_away_item?',
      ["bundle", "vault"],
      [assert_result]
    )
  end

  #########################################
  # STOW HANDS
  #########################################

  def test_stow_hands__open_pouch_for_gem_in_left_hand
    $left_hand = 'crystal'
    $right_hand = nil

    run_drci_command(
      ["You open your pouch and put the icy blue crystal inside, closing it once more."],
      'stow_hands',
      [],
      [assert_result]
    )
  end

  def test_stow_hands__open_pouch_for_gem_in_right_hand
    $left_hand = nil
    $right_hand = 'crystal'

    run_drci_command(
      ["You open your pouch and put the icy blue crystal inside, closing it once more."],
      'stow_hands',
      [],
      [assert_result]
    )
  end

  def test_stow_hands__skip_if_hands_empty
    $left_hand = nil
    $right_hand = nil

    run_drci_command(
      [],
      'stow_hands',
      [],
      [assert_result]
    )
  end

  #########################################
  # DISPOSE TRASH
  #########################################

  def test_dispose_trash__early_exit__no_item
    run_drci_command(
      [
      ],
      'dispose_trash',
      [nil],
      [refute_result]
    )
  end

  def test_dispose_trash__worn_trashcan__retries
    run_drci_command(
      [
        'perhaps try doing that again',
        'You drop a rock into a portable silversteel bucket with a flared rim.  Glancing inside, you notice the item being swirled in a whirlpool before dropping to the bottom of the bucket.',
        'You drum your fingers on the bucket rhythmically.',
        '[OOC: TAP the bucket again within the next 30 seconds to flush it.].',
        'You drum your fingers on the bucket rhythmically.',
        'After a moment, a dull THUD echoes from within the bucket.'
      ],
      'dispose_trash',
      ["rock", "silversteel bucket", "tap"],
      [assert_result]
    )
  end

  def test_dispose_trash__worn_trashcan__happy_path
    run_drci_command(
      [
        'You drop a rock into a portable silversteel bucket with a flared rim.  Glancing inside, you notice the item being swirled in a whirlpool before dropping to the bottom of the bucket.',
        'You drum your fingers on the bucket rhythmically.',
        '[OOC: TAP the bucket again within the next 30 seconds to flush it.].',
        'You drum your fingers on the bucket rhythmically.',
        'After a moment, a dull THUD echoes from within the bucket.'
      ],
      'dispose_trash',
      ["rock", "silversteel bucket", "tap"],
      [assert_result]
    )
  end

  def test_dispose_trash__should_drop_ocarina_on_ground
    run_drci_command(
      [
        "Whoah!  Dropping a silverwillow ocarina would damage it!  If you wish to set the ocarina down, LOWER it.",
        "You drop your ocarina on the ground, causing it to hit the surface with a dull *creak*."
      ],
      'dispose_trash',
      ["ocarina"],
      [assert_result]
    )
  end

  def test_dispose_trash__should_smash_ocarina_to_bits
    run_drci_command(
      ["In sudden anger, you fling the ocarina to the ground, smashing it to bits!"],
      'dispose_trash',
      ["ocarina"],
      [assert_result]
    )
  end

  def test_dispose_trash__should_drop_pack_on_ground
    run_drci_command(
      ["You drop a storm grey pack."],
      'dispose_trash',
      ["pack"],
      [assert_result]
    )
  end

  def test_dispose_trash__should_drop_pants_in_barrel
    run_drci_command(
      ["You drop some faded pants in a large wooden barrel."],
      'dispose_trash',
      ["faded pants"],
      [assert_result]
    )
  end

  def test_dispose_trash__should_drop_lily_in_bucket
    run_drci_command(
      ["You drop a queen-of-the-night lily in a bucket of viscous gloop."],
      'dispose_trash',
      ["lily"],
      [assert_result]
    )
  end

  def test_dispose_trash__should_spread_blanket_on_ground
    run_drci_command(
      ["You spread a thick sea-blue wool blanket embroidered with twining vines on the ground."],
      'dispose_trash',
      ["wool blanket"],
      [assert_result]
    )
  end

  def test_dispose_trash__should_release_moonblade
    run_drci_command(
      ["As you open your hand to release the moonblade, it crumbles into a fine ash."],
      'dispose_trash',
      ["moonblade"],
      [assert_result]
    )
  end

  #########################################
  # OPEN CONTAINER
  #########################################

  def test_open_container__should_slowly_open
    run_drci_command(
      ["You slowly open some dark encompassing shadows, glancing around suspiciously."],
      'open_container?',
      ["shadows"],
      [assert_result]
    )
  end

  def test_open_container__should_unbutton
    run_drci_command(
      ["You unbutton the flap of your satchel, pulling it open to reveal the contents."],
      'open_container?',
      ["satchel"],
      [assert_result]
    )
  end

  def test_open_container__should_open
    run_drci_command(
      ["You open your medicine pouch."],
      'open_container?',
      ["medicine pouch"],
      [assert_result]
    )
  end

  def test_open_container__should_spread_arms
    run_drci_command(
      ["You spread your arms, carefully holding your bag well away from your body"],
      'open_container?',
      ["harvest bag"],
      [assert_result]
    )
  end

  def test_open_container__should_already_be_open
    run_drci_command(
      ["That is already open."],
      'open_container?',
      ["medicine pouch"],
      [assert_result]
    )
  end

  def test_open_container__should_already_be_open2
    run_drci_command(
      ["The wyvern skull's jaw is already open."],
      'open_container?',
      ["skull"],
      [assert_result]
    )
  end

  def test_open_container__please_rephrase
    run_drci_command(
      ["Please rephrase that command."],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__what_were_you_referring
    run_drci_command(
      ["What were you referring to?"],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__could_not_find
    run_drci_command(
      ["I could not find what you were referring to."],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__ruin_your_spell
    run_drci_command(
      ["You don't want to ruin your spell just for that do you?"],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__disturb_the_silence
    run_drci_command(
      ["It would be a shame to disturb the silence of this place for that."],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__not_the_place
    run_drci_command(
      ["This is probably not the time nor place for that."],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__no_way_to_do_that
    run_drci_command(
      ["There is no way to do that."],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__you_cant_do_that
    run_drci_command(
      ["You can't do that."],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__you_cant_do_that_while
    run_drci_command(
      ["You can't do that while kneeling!"],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__you_cant_do_that_here
    run_drci_command(
      ["You can't do that in here."],
      'open_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_open_container__you_cant_do_that_to_item
    run_drci_command(
      ["You can't do that to a brass jailer's nightstick with inconspicuous studs!"],
      'open_container?',
      ["jailer's nightstick"],
      [refute_result]
    )
  end

  #########################################
  # CLOSE CONTAINER
  #########################################

  def test_close_container__should_pull
    run_drci_command(
      ["You pull the flap of your satchel closed and button it securely."],
      'close_container?',
      ["satchel"],
      [assert_result]
    )
  end

  def test_close_container__should_close
    run_drci_command(
      ["You close your medicine pouch."],
      'close_container?',
      ["medicine pouch"],
      [assert_result]
    )
  end

  def test_close_container__should_quickly_close
    run_drci_command(
      ["You quickly close your bag."],
      'close_container?',
      ["bag"],
      [assert_result]
    )
  end

  def test_close_container__should_already_be_closed
    run_drci_command(
      ["That is already closed."],
      'close_container?',
      ["medicine pouch"],
      [assert_result]
    )
  end

  def test_close_container__should_already_be_closed2
    run_drci_command(
      ["The wyvern skull's jaw is already closed."],
      'close_container?',
      ["skull"],
      [assert_result]
    )
  end

  def test_close_container__please_rephrase
    run_drci_command(
      ["Please rephrase that command."],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__what_were_you_referring
    run_drci_command(
      ["What were you referring to?"],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__could_not_find
    run_drci_command(
      ["I could not find what you were referring to."],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__ruin_your_spell
    run_drci_command(
      ["You don't want to ruin your spell just for that do you?"],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__disturb_the_silence
    run_drci_command(
      ["It would be a shame to disturb the silence of this place for that."],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__not_the_place
    run_drci_command(
      ["This is probably not the time nor place for that."],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__no_way_to_do_that
    run_drci_command(
      ["There is no way to do that."],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__you_cant_do_that
    run_drci_command(
      ["You can't do that."],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__you_cant_do_that_while
    run_drci_command(
      ["You can't do that while kneeling!"],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__you_cant_do_that_here
    run_drci_command(
      ["You can't do that in here."],
      'close_container?',
      ["medicine pouch"],
      [refute_result]
    )
  end

  def test_close_container__you_cant_do_that_to_item
    run_drci_command(
      ["You can't do that to a brass jailer's nightstick with inconspicuous studs!"],
      'close_container?',
      ["jailer's nightstick"],
      [refute_result]
    )
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

  #########################################
  # COUNT BOXES
  #########################################
  def run_get_box_list_in_container_with_mocks(bag_name, assertions)
    @test = run_script_with_proc(['common-items'], proc do
      # Setup
      DRCI.send(:remove_const, "DRC") if defined?(DRCI::DRC)
      DRCI.const_set("DRC", @fake_drc)

      # Test
      boxes = DRCI.get_box_list_in_container(bag_name);

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(boxes) }
    end)
  end

  def test_get_box_list_for_container
    bag_name = "foobag"
    @fake_drc.expect(:rummage, [], ['B', bag_name])

    run_get_box_list_in_container_with_mocks(bag_name, [
      proc { |box_list| assert_equal([], box_list) }
    ])
  end

  def run_count_all_boxes(settings, assertions)
    @test = run_script_with_proc(['common-items'], proc do
      # Setup
      DRCI.send(:remove_const, "DRC") if defined?(DRCI::DRC)
      DRCI.const_set("DRC", @fake_drc)

      # Test
      box_count = DRCI.count_all_boxes(settings);

      # Assert
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(box_count) }
    end)
  end

  def test_count_all_boxes_zero_with_no_containers
    settings = load_base_settings

    run_count_all_boxes(settings, [
      proc { |box_count| assert_equal(0, box_count) }
    ])
  end

  def test_count_all_boxes_zero_with_empty_picking_box_source
    settings = load_base_settings({'picking_box_source' => 'picking_box_bag'})
    @fake_drc.expect(:rummage, [], ['B', 'picking_box_bag'])

    run_count_all_boxes(settings, [
      proc { |box_count| assert_equal(0, box_count) }
    ])
  end

  def test_count_all_boxes_matches_with_only_picking_box_source
    settings = load_base_settings({'picking_box_source' => 'picking_box_bag'})
    @fake_drc.expect(:rummage, ['iron coffer', 'wooden crate'], ['B', 'picking_box_bag'])

    run_count_all_boxes(settings, [
      proc { |box_count| assert_equal(2, box_count) }
    ])
  end

  def test_count_all_boxes_does_not_multi_count
    settings = load_base_settings({
      'picking_box_source' => 'picking_box_bag',
      'pick' => {'too_hard_container' => 'picking_box_bag'}
    })
    @fake_drc.expect(:rummage, ['iron coffer', 'wooden crate'], ['B', 'picking_box_bag'])

    run_count_all_boxes(settings, [
      proc { |box_count| assert_equal(2, box_count) }
    ])
  end

  def test_count_all_boxes_adds_all_bags
    settings = load_base_settings({
      'pick' => {
        'picking_box_sources' => ['lootsack', 'stow_bag'],
        'too_hard_container' => 'too_hard_bag'
      }
    })
    @fake_drc.expect(:rummage, ['iron chest'], ['B', 'lootsack'])
    @fake_drc.expect(:rummage, ['iron coffer', 'wooden crate'], ['B', 'stow_bag'])
    @fake_drc.expect(:rummage, ['iron box', 'wooden strongbox', 'steel caddy'], ['B', 'too_hard_bag'])

    run_count_all_boxes(settings, [
      proc { |box_count| assert_equal(6, box_count) }
    ])
  end

end
