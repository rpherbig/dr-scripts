require_relative 'test_helper'

load 'test/test_harness.rb'

include Harness

class TestPerceiveHealth < Minitest::Test

  def setup
    reset_data
  end

  def teardown
    @test.join if @test
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

  def assert_parasites(expected_number)
    # Parasites are always severity 1 today, so just select the length of that value array
    proc { |health| assert_equal(expected_number, health['parasites'][1].count, 'Person has wrong number of parasites.') }
  end

  def assert_wound_count(expected_number)
    proc { |health| assert_equal(expected_number, health['wounds'].values.flatten.count, 'Person has wrong number of wounds.') }
  end

  def parse_perceived_health(messages, target, assertions = [])
    $server_buffer = messages.dup
    $history = $server_buffer.dup
    @test = run_script_with_proc(['common', 'common-healing-data', 'common-healing'], proc do
      perceived_health = DRCH.parse_perceived_health(target)
      assertions = [assertions] unless assertions.is_a?(Array)
      assertions.each { |assertion| assertion.call(perceived_health) }
    end)
  end

  def test_parse_perceived_health_other_wounds_and_parasites
    messages = [
      'Arnas\'s injuries include...',
      'Wounds to the NECK:',
      'Fresh External:  light scratches -- insignificant (1/13)',
      'Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the RIGHT ARM:',
      'Fresh External:  cuts and bruises about the right arm -- more than minor (4/13)',
      'Fresh Internal:  minor swelling and bruising around the right arm -- more than minor (4/13)',
      'Wounds to the LEFT ARM:',
      'Fresh Internal:  minor swelling and bruising around the left arm -- more than minor (4/13)',
      'Wounds to the RIGHT LEG:',
      'Fresh External:  light scratches -- negligible (2/13)',
      'Fresh Internal:  slightly tender -- negligible (2/13)',
      'You also sense...',
      '... a small red blood mite on his right leg.',
      'Arnas is suffering from an insignificant loss of vitality (0%).'
    ]
    parse_perceived_health(messages, 'Arnas', [
      assert_not_poisoned,
      assert_not_diseased,
      assert_parasites(1),
      assert_wound_count(7)
    ])
  end

  def test_parse_perceived_health_other_poison_no_wounds
    messages = [
      'Caprianna\'s injuries include...',
      ' ... no injuries to speak of.',
      'She has a seriously poisoned right arm.',
      'Caprianna has normal vitality.'
    ]
    parse_perceived_health(messages, 'Caprianna', [
      assert_poisoned,
      assert_not_diseased,
      assert_no_parasites,
      assert_wound_count(0)
    ])
  end

  def test_parse_perceived_health_other_poison_and_wounds
    messages = [
      'Gorloke\'s injuries include...',
      'Wounds to the LEFT ARM:',
      '  Fresh Internal:  minor swelling and bruising around the left arm -- more than minor (4/13)',
      'Wounds to the RIGHT HAND:',
      '  Fresh External:  light scratches -- negligible (2/13)',
      '  Fresh Internal:  slightly tender -- negligible (2/13)',
      'Wounds to the LEFT HAND:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the CHEST:',
      '  Fresh External:  light scratches -- negligible (2/13)',
      '  Fresh Internal:  slightly tender -- negligible (2/13)',
      'Wounds to the ABDOMEN:',
      '  Fresh External:  cuts and bruises about the abdomen -- more than minor (4/13)',
      '  Fresh Internal:  minor swelling and bruising in the abdomen -- more than minor (4/13)',
      'Wounds to the LEFT EYE:',
      '  Fresh External:  light scratches -- negligible (2/13)',
      '  Fresh Internal:  slightly tender -- negligible (2/13)',
      'He has a dangerously poisoned abdomen.',
      'Gorloke has normal vitality.'
    ]
    parse_perceived_health(messages, 'Gorloke', [
      assert_poisoned,
      assert_not_diseased,
      assert_no_parasites,
      assert_wound_count(11)
    ])
  end

  def test_parse_perceived_health_self_poison_and_wounds
    messages = [
      'Your injuries include...',
      'Wounds to the NECK:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Scars External:  slight discoloration -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      '  Scars Internal:  minor internal scarring -- insignificant (1/13)',
      'Wounds to the RIGHT ARM:',
      '  Fresh External:  light scratches -- negligible (2/13)',
      '  Scars External:  slight discoloration -- negligible (2/13)',
      '  Fresh Internal:  slightly tender -- negligible (2/13)',
      '  Scars Internal:  minor internal scarring -- negligible (2/13)',
      'Wounds to the LEFT ARM:',
      '  Fresh External:  light scratches -- negligible (2/13)',
      '  Scars External:  slight discoloration -- negligible (2/13)',
      '  Fresh Internal:  slightly tender -- negligible (2/13)',
      '  Scars Internal:  minor internal scarring -- negligible (2/13)',
      'Wounds to the RIGHT LEG:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Scars External:  slight discoloration -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      '  Scars Internal:  minor internal scarring -- insignificant (1/13)',
      'Wounds to the LEFT LEG:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Scars External:  slight discoloration -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      '  Scars Internal:  minor internal scarring -- insignificant (1/13)',
      'Wounds to the CHEST:',
      '  Scars Internal:  an occasional twitching in the chest area -- more than minor (4/13)',
      'Wounds to the ABDOMEN:',
      '  Scars External:  minor scarring along the abdomen -- more than minor (4/13)',
      '  Scars Internal:  an occasional twitching in the abdomen -- more than minor (4/13)',
      'You have a dangerously poisoned left leg.',
      'You have normal vitality.',
      'You are unusually full of extra energy.'
    ]
    parse_perceived_health(messages, nil, [
      assert_poisoned,
      assert_not_diseased,
      assert_no_parasites,
      assert_wound_count(23)
    ])
  end

  def test_parse_perceived_health_other_nothing_wrong
    messages = [
      'Brisby\'s injuries include...',
      '... no injuries to speak of.',
      'Brisby has normal vitality.'
    ]
    parse_perceived_health(messages, 'Brisby', [
      assert_not_poisoned,
      assert_not_diseased,
      assert_no_parasites,
      assert_wound_count(0)
    ])
  end

  def test_parse_perceived_health_other_internal_poison_and_wounds
    messages = [
      'Corgar\'s injuries include...',
      'Wounds to the RIGHT LEG:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the LEFT HAND:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the ABDOMEN:',
      '  Fresh Internal:  slightly tender -- negligible (2/13)',
      'He has a critically strong internal poison.',
      'Corgar is suffering from an insignificant loss of vitality (1%).'
    ]
    parse_perceived_health(messages, 'Corgar', [
      assert_poisoned,
      assert_not_diseased,
      assert_no_parasites,
      assert_wound_count(5)
    ])
  end

  def test_parse_perceived_health_self_internal_poison_and_wounds
    messages = [
      'Your injuries include...',
      'Wounds to the HEAD:',
      'Fresh External:  light scratches -- negligible (2/13)',
      'Scars External:  slight discoloration -- negligible (2/13)',
      'Wounds to the ABDOMEN:',
      'Fresh Internal:  slightly tender -- insignificant (1/13)',
      'You have a mildly strong internal poison.',
      'You have normal vitality.',
    ]
    parse_perceived_health(messages, nil, [
      assert_poisoned,
      assert_not_diseased,
      assert_no_parasites,
      assert_wound_count(3)
    ])
  end

  def test_parse_perceived_health_other_cyanide_poison_and_wounds_and_lodges
    messages = [
      'Corgar\'s injuries include...',
      'Wounds to the RIGHT ARM:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the RIGHT LEG:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the LEFT LEG:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the LEFT HAND:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the CHEST:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  minor swelling and bruising in the chest area -- more than minor (4/13)',
      'Wounds to the ABDOMEN:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  a severely bloated and discolored abdomen with strange round lumps under the skin -- very severe (10/13)',
      'Wounds to the BACK:',
      '  Fresh Internal:  a severely swollen and deeply bruised back with ribs or vertebrae protruding out from the skin -- devastating (11/13)',
      'Wounds to the RIGHT EYE:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the SKIN:',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'He looks somewhat tired and seems to be having trouble breathing.  Cyanide poison!',
      'You also sense...',
      '... a tiny dart lodged firmly in his head.',
      'Corgar is suffering from an extreme loss of vitality (81%).'
    ]
    parse_perceived_health(messages, 'Corgar', [
      assert_poisoned,
      assert_not_diseased,
      assert_no_parasites,
      assert_wound_count(16)
    ])
  end

  def test_parse_perceived_health_other_disease_and_wounds
    messages = [
      'Seakutsen\'s injuries include...',
      'Wounds to the RIGHT ARM:',
      '  Fresh External:  light scratches -- negligible (2/13)',
      '  Fresh Internal:  slightly tender -- negligible (2/13)',
      'Wounds to the LEFT LEG:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the CHEST:',
      '  Fresh External:  deep cuts across the chest area -- harmful (5/13)',
      '  Fresh Internal:  severely swollen and bruised chest area -- harmful (5/13)',
      'Wounds to the ABDOMEN:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'Wounds to the BACK:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      'His wounds are infected.',
      'Seakutsen is suffering from an insignificant loss of vitality (1%).'
    ]
    parse_perceived_health(messages, 'Seakutsen', [
      assert_not_poisoned,
      assert_diseased,
      assert_no_parasites,
      assert_wound_count(10)
    ])
  end

  def test_parse_perceived_health_self_disease_and_wounds
    messages = [
      'Your injuries include...',
      'Wounds to the RIGHT ARM:',
      '  Fresh External:  light scratches -- negligible (2/13)',
      '  Scars External:  slight discoloration -- negligible (2/13)',
      '  Fresh Internal:  slightly tender -- negligible (2/13)',
      '  Scars Internal:  minor internal scarring -- negligible (2/13)',
      'Wounds to the LEFT LEG:',
      '  Fresh External:  light scratches -- insignificant (1/13)',
      '  Scars External:  slight discoloration -- insignificant (1/13)',
      '  Fresh Internal:  slightly tender -- insignificant (1/13)',
      '  Scars Internal:  minor internal scarring -- insignificant (1/13)',
      'Wounds to the CHEST:',
      '  Fresh External:  cuts and bruises about the chest area -- more than minor (4/13)',
      '  Scars External:  minor scarring along the chest area -- more than minor (4/13)',
      '  Fresh Internal:  minor swelling and bruising in the chest area -- more than minor (4/13)',
      '  Scars Internal:  an occasional twitching in the chest area -- more than minor (4/13)  ',
      'Your wounds are infected.',
      'You have normal vitality.',
      'You are unusually full of extra energy.'
    ]
    parse_perceived_health(messages, nil, [
      assert_not_poisoned,
      assert_diseased,
      assert_no_parasites,
      assert_wound_count(12)
    ])
  end

  def test_parse_perceived_health_other_poison_and_mites
    messages = [
      'You touch Muleoak.',
      'You sense a successful empathic link has been forged between you and Muleoak.',
      'You feel the burning fire of pain and suffering building slowly as you instinctively draw out the truth behind Muleoak\'s injuries.',
      'Muleoak\'s injuries include...',
      'Wounds to the HEAD:',
      '  Fresh External:  light scratches -- negligible',
      '  Fresh Internal:  slightly tender -- negligible',
      'Wounds to the LEFT ARM:',
      '  Fresh External:  light scratches -- insignificant',
      '  Fresh Internal:  slightly tender -- insignificant',
      'Wounds to the RIGHT LEG:',
      '  Fresh External:  light scratches -- insignificant',
      '  Fresh Internal:  slightly tender -- insignificant',
      'Wounds to the CHEST:',
      '  Fresh External:  cuts and bruises about the chest area -- minor',
      '  Fresh Internal:  minor swelling and bruising in the chest area -- minor',
      'Wounds to the LEFT EYE:',
      '  Fresh External:  light scratches -- negligible',
      '  Fresh Internal:  slightly tender -- negligible',
      'He has a dangerously strong nerve poison.',
      'You sense...',
      '... a large black blood mite on his right eye.',
      '... a large black blood mite on his right eye.',
      'Muleoak has normal vitality.'
    ]
    parse_perceived_health(messages, 'Muleoak', [
      assert_poisoned,
      assert_not_diseased,
      assert_parasites(2),
      assert_wound_count(10)
    ])
  end

  def test_parse_perceived_health_other_wounds_and_sores
    messages = [
      'You touch Muleoak.',
      'You sense a successful empathic link has been forged between you and Muleoak.',
      'You feel the burning fire of pain and suffering building slowly as you instinctively draw out the truth behind Muleoak\'s injuries.',
      'Muleoak\'s injuries include...',
      'Wounds to the RIGHT ARM:',
      '  Fresh External:  deep cuts across the right arm -- harmful',
      '  Fresh Internal:  a severely swollen and deeply bruised right arm -- harmful',
      'His skin is covered with open oozing sores.',
      'Muleoak is suffering from a mild loss of vitality (15%).'
    ]
    parse_perceived_health(messages, 'Muleoak', [
      assert_not_poisoned,
      assert_diseased,
      assert_no_parasites,
      assert_wound_count(2)
    ])
  end

  def test_parse_perceived_health_other_badly_infected
    messages = [
      'You touch Philian.',
      'You sense a successful empathic link has been forged between you and Philian.',
      'You feel the burning fire of pain and suffering building slowly as you instinctively draw out the truth behind Philian\'s injuries.',
      'Philian\'s injuries include...',
      'Wounds to the SKIN:',
      '  Fresh External:  open and bleeding sores all over the skin -- useless (13/13)',
      '  Fresh Internal:  complete paralysis of the entire body -- useless (13/13)',
      'His wounds are badly infected.'
    ]
    parse_perceived_health(messages, 'Philian', [
      assert_not_poisoned,
      assert_diseased,
      assert_no_parasites,
      assert_wound_count(2)
    ])
  end
end
