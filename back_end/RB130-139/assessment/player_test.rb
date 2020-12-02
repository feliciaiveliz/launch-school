# player_test.rb
require 'minitest/autorun'
# require "minitest/reporters"
# Minitest::Reporters.use!

require_relative 'player'

class PlayerTest < MiniTest::Test

  def setup
    @initial_health = 100
    @player = Player.new("john", @initial_health)
    @default_player = Player.new("jane")
  end

  def test_name_is_capitalized
    assert_equal(@player.name, 'John')
  end

  def test_health
    assert_equal(@player.health, @initial_health)
    assert_equal(@default_player.health, 50)
  end

  def test_to_s
    #skip
    assert_equal(@player.to_s, "I'm John with health = 100.")
    @player.health = -1
    assert_equal(@player.to_s, "I was John, now I am dead :(.")
  end

  def test_raises_error
    #skip
    @player.health = -1
    assert_raises(NoMethodError) { @player.boost }
    assert_raises(NoMethodError) { @player.hurt }
  end

  def test_boost
    #skip
    @player.boost
    assert_equal(@player.health, @initial_health + 20)
  end

  def test_hurt
    #skip
    @player.hurt
    assert_equal(@player.health, @initial_health - 10)
  end

  def test_dead?
    #skip
    @player.health = -1
    assert(@player.dead?)
  end
end