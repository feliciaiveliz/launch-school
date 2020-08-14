require 'minitest/autorun'
require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_name
    assert_equal(@kitty.name, 'Milo')
  end

  # def test_miaow
  #   assert_match(@kitty.miaow, / is miaowing\./)
  # end

  # def test_raises_error
  #   assert_raises(ArgumentError) do
  #     Cat.new("Milo")
  #   end
  # end
end

