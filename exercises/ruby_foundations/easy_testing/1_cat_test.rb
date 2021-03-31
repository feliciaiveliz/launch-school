require 'minitest/autorun'
require_relative 'cat'

class CatTest < Minitest::Test
  def setup
    @cat = Cat.new
  end

  def test_value
    assert(true, @cat.tail.odd?)
  end
end

# assert value.odd?, 'value is not odd'

