require 'minitest/autorun'
require_relative 'cipher'

class CipherTest < Minitest::Test
  def test_rotate_a_by_0_same_output_as_input
    # skip
    assert_equal "a", Cipher.rotate("a", 0)
  end

  def test_rotate_a_by_1
    #skip
    assert_equal "b", Cipher.rotate("a", 1)
  end

  def test_rotate_a_by_26_same_output_as_input
    #skip
    assert_equal "a", Cipher.rotate("a", 26)
  end

  def test_rotate_m_by_13
    #skip
    assert_equal "z", Cipher.rotate("m", 13)
  end

  def test_rotate_n_by_13_with_wrap_around_alphabet
    #skip
    assert_equal "a", Cipher.rotate("n", 13)
  end

  def test_rotate_capital_letters
    #skip
    assert_equal "TRL", Cipher.rotate("OMG", 5)
  end

  def test_rotate_spaces
    #skip
    assert_equal "T R L", Cipher.rotate("O M G", 5)
  end

  def test_rotate_numbers
    #skip
    assert_equal "Xiwxmrk 1 2 3 xiwxmrk",
                 Cipher.rotate("Testing 1 2 3 testing", 4)
  end

  def test_rotate_punctuation
    #skip
    assert_equal "Gzo'n zvo, Bmviyhv!",
                 Cipher.rotate("Let's eat, Grandma!", 21)
  end

  def test_rotate_all_letters
    #skip
    assert_equal "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.",
      Cipher.rotate("The quick brown fox jumps over the lazy dog.", 13)
  end
end