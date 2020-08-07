require 'minitest/autorun'
require_relative 'odd_words'

class OddWordsTest < Minitest::Test
  def test_empty_string
    assert_equal('', OddWords.new('').reverse!)
  end

  def test_period
    assert_equal('.', OddWords.new('.').reverse!)
  end

  def test_single_word
    assert_equal('pizza.', OddWords.reverse!(' pizza.'))
  end

  def test_single_spaces_between_all_words
    expected = 'whats eht matter htiw kansas'
    text = OddWords.new('whats the matter with kansas')
    assert_equal(expected, text.reverse!)
  end

  def test_random_amounts_of_spaces_between_words
    expected = 'i rehtar hang tuo with ym cat.'
    assert_equal(expected, OddWords.new('i rather  hang out with. my  cat  .').reverse!)
  end

  def test_whole_name
    expected = 'felicia zilevi khan nocab'
    assert_equal(expected, OddWords.new('felicia  iveliz   khan  bacon').reverse!)
  end
end

