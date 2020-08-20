# puts "Hey Study Dream Team"
# https://launchschool.com/exercises/47da672c
# Regex - 
# Medium problems - coding challenge
# procs and how to remember the use cases for '&'

# ampersand will convert something from what it is to the opposite( block -> proc or proc-> bloc)
# (&:symbol)
# This is an example of Ruby’s syntactical sugar. Under the hood, Ruby checks whether the symbol object after `&` is a `Proc`. If it is it uses the object as-is. Otherwise it calls `#to_proc` on the object which should return a `Proc` object. An error will occur if it fails to convert. 
# `&` then turns the Proc into a block.


=begin

Crypto Square
Implement the classic method for composing secret messages called a square code.

The input is first normalized: The spaces and punctuation are removed from the English text and the message is down-cased.

Then, the normalized characters are broken into rows. These rows can be regarded as forming a rectangle when printed with intervening newlines.

For example, the sentence

If man was meant to stay on the ground god would have given us roots

is 54 characters long.

Broken into 8-character columns, it yields 7 rows.

Those 7 rows produce this rectangle when printed one per line:

ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots
The coded message is obtained by reading down the columns going left to right. For example, the message above is coded as:

imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
Write a program that, given an English text, outputs the encoded version of that text.

The size of the square (number of columns) should be decided by the length of the message. If the message is a length that creates a perfect square (e.g. 4, 9, 16, 25, 36, etc), use that number of columns. If the message doesn't fit neatly into a square, choose the number of columns that corresponds to the smallest square that is larger than the number of characters in the message.

For example, a message 4 characters long should use a 2 x 2 square. A message that is 81 characters long would use a square that is 9 columns wide. A message between 5 and 8 characters long should use a rectangle 3 characters wide.

Output the encoded text grouped by column.

Test suite:

# goal is to encrypt 

=end



# my_obj = Proc.new { puts "hi"} # instantiated a new `Proc` object.
# my_str = 'Hello'
# my_lambda = lambda{ |n| return 'my lambda'}
# # p my_obj
# # p my_lambda

# def a_method(obj)
#   [1,2,3].map(&obj) 
# end

# p a_method(my_obj)
# p a_method(my_lambda)
# a_method(my_str)


# new_proc = proc { p "I'm singing in the rain!"}
# def sing(&new_proc)
#   p new_proc
#   new_proc.call
# end
  
# sing { p "I'm singing in the rain!"}
# def method_with_explicit_block(&block)
#  puts "1"
#  another_method(block)
# end

# method_with_explicit_block { puts "3" }


# def method_with_proc(new_proc)
#  new_proc.call
# end

# name = "Chris"
# new_proc = proc { name }

# p method_with_proc(new_proc)

=begin
Implement the classic method for composing secret messages called a square code.

The input is first normalized: The spaces and punctuation are removed from the English text and the message is down-cased.

Then, the normalized characters are broken into rows. These rows can be regarded as forming a rectangle when printed with intervening newlines.

For example, the sentence

If man was meant to stay on the ground god would have given us roots

is 54 characters long.

Broken into 8-character columns, it yields 7 rows.

Those 7 rows produce this rectangle when printed one per line:


ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots

The coded message is obtained by reading down the columns going left to right. For example, the message above is coded as:

imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
Write a program that, given an English text, outputs the encoded version of that text.

The size of the square (number of columns) should be decided by the length of the message. If the message is a length that creates a perfect square (e.g. 4, 9, 16, 25, 36, etc), use that number of columns. If the message doesn't fit neatly into a square, choose the number of columns that corresponds to the smallest square that is larger than the number of characters in the message.

For example, a message 4 characters long should use a 2 x 2 square. A message that is 81 characters long would use a square that is 9 columns wide. A message between 5 and 8 characters long should use a rectangle 3 characters wide.

Richard - look at the question first, understand the problem first, look at what i don't understand.
# there are some lines that i may not understand and i spend time digesting.
Then i look at the test cases - they tell me what i need to understand - i write notes next to the test cases.
I write down my algorithm and type that out. Then i play around with my test cases as i go along.
Felicia - start by getting a whole picture of what they are asking
- jump into test cases at one time
- Look at what type of methods they ask for
- 

Example

=end

# p Math.sqrt(10).ceil


require 'minitest/autorun'
class Crypto
  def normalize_plaintext
    # remove special chars
    # lowercased everything
    # no spaces between words
    # kept the digits
  end
  
  def size
    # 4 chars: 2
    # 
  end
end

class CryptoTest < Minitest::Test
  def test_normalize_strange_characters
    crypto = Crypto.new('s#$%^&plunk')
    assert_equal 'splunk', crypto.normalize_plaintext
  end

  def test_normalize_uppercase_characters
    skip
    crypto = Crypto.new('WHOA HEY!')
    assert_equal 'whoahey', crypto.normalize_plaintext
  end

  def test_normalize_with_numbers
    skip
    crypto = Crypto.new('1, 2, 3 GO!')
    assert_equal '123go', crypto.normalize_plaintext
  end

  def test_size_of_small_square
    skip
    crypto = Crypto.new('1234')
    assert_equal 2, crypto.size
  end

  def test_size_of_slightly_larger_square
    skip
    crypto = Crypto.new('123456789')
    assert_equal 3, crypto.size
  end

  def test_size_of_non_perfect_square
    skip
    crypto = Crypto.new('123456789abc')
    assert_equal 4, crypto.size
  end

  def test_size_is_determined_by_normalized_plaintext
    skip
    crypto = Crypto.new('Oh hey, this is nuts!')
    assert_equal 4, crypto.size
  end

  def test_plaintext_segments
    skip
    crypto = Crypto.new('Never vex thine heart with idle woes')
    expected = %w(neverv exthin eheart withid lewoes)
    assert_equal expected, crypto.plaintext_segments
  end

  def test_other_plaintext_segments
    skip
    crypto = Crypto.new('ZOMG! ZOMBIES!!!')
    assert_equal %w(zomg zomb ies), crypto.plaintext_segments
  end

  def test_ciphertext
    skip
    crypto = Crypto.new('Time is an illusion. Lunchtime doubly so.')
    assert_equal 'tasneyinicdsmiohooelntuillibsuuml', crypto.ciphertext
  end

  def test_another_ciphertext
    skip
    crypto = Crypto.new('We all know interspecies romance is weird.')
    assert_equal 'wneiaweoreneawssciliprerlneoidktcms', crypto.ciphertext
  end

  def test_normalized_ciphertext
    skip
    crypto = Crypto.new('Vampires are people too!')
    assert_equal 'vrel aepe mset paoo irpo', crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_spills_into_short_segment
    skip
    crypto = Crypto.new('Madness, and then illumination.')
    expected = 'msemo aanin dnin ndla etlt shui'
    assert_equal expected, crypto.normalize_ciphertext
  end

  def test_another_normalized_ciphertext
    skip
    crypto = Crypto.new(
      'If man was meant to stay on the ground god would have given us roots',
    )
    expected = 'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau'
    assert_equal expected, crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_with_punctuation
    skip
    crypto = Crypto.new('Have a nice day. Feed the dog & chill out!')
    expected = 'hifei acedl veeol eddgo aatcu nyhht'
    assert_equal expected, crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_when_just_less_then_a_full_square
    skip
    crypto = Crypto.new('I am')
    assert_equal 'im a', crypto.normalize_ciphertext
  end
end
