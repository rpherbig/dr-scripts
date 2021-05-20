require_relative 'test_helper'
require 'ostruct'

load 'test/test_harness.rb'

include Harness

class TestSetupConfig < Minitest::Test

  def setup
    reset_data
    $history = ['quit']
    load('edityaml.lic')
  end

  def teardown
    @test.join if @test
    $save_character_profile = nil
  end

  def test_saving_sends_loaded_data
    $character_setting = OpenStruct.new(some: 'data')
    $history = ['save']
    SetupConfig.new

    assert_equal({ some: 'data' }, $save_character_profile)
  end

  def test_doesnt_save_on_quit
    $character_setting = OpenStruct.new(some: 'data')
    $history = ['quit']
    SetupConfig.new

    assert_nil($save_character_profile)
  end
end
