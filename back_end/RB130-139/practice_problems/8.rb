require 'minitest/autorun'

class Cat
  attr_accessor :name
end

class CatTest < MiniTest::Test
  def test_value_equality
    cat1 = Cat.new
    cat2 = Cat.new

    cat1.name = "Vaquita"
    cat2.name = "Vaquita"

    assert_equal(cat1, cat2)
  end
end