# Diamond
# The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.
# Examples

# Diamond for letter 'A':

# Examples

# Diamond for letter 'A':

# Copy Code
# A
# Diamond for letter 'C':

# Copy Code
#   A
#  B B
# C   C
#  B B
#   A
# Diamond for letter 'E':

# Copy Code
#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A


class Diamond

  ARRAY = ("A".."Z").to_a

  def self.make_diamond(letter)
    result = ""
    index = 0

    ("A").upto(letter) do |char|
      result += " " * (ARRAY.index(char) + index) + char + " " * ARRAY.index(char) + "\n"
      index += 1
    end
    result
  end


#   def self.make_diamond(letter)
#     result = ""

end

p Diamond.make_diamond("A") == "A\n"
p Diamond.make_diamond("B") # " A \nB B\n A \n"



# require 'minitest/autorun'
# #require_relative '10_diamond'

# class DiamondTest < Minitest::Test
#   def test_letter_a
#     answer = Diamond.make_diamond('A')
#     assert_equal "A\n", answer
#   end

#   def test_letter_b
#     skip
#     answer = Diamond.make_diamond('B')
#     assert_equal " A \nB B\n A \n", answer
#   end

#   def test_letter_c
#     skip
#     answer = Diamond.make_diamond('C')
#     string = "  A  \n" # 0 2     0
#              " B B \n" # 1 1     1
#              "C   C\n" # 2 0     2
#              " B B \n" # 1 1     1
#              "  A  \n"  # 0 2     0
#     assert_equal string, answer
#   end

#   def test_letter_e
#     skip
#     answer = Diamond.make_diamond('E')
#     string = "    A    \n"\
#              "   B B   \n"\
#              "  C   C  \n"\
#              " D     D \n"\
#              "E       E\n"\
#              " D     D \n"\
#              "  C   C  \n"\
#              "   B B   \n"\
#              "    A    \n"
#     assert_equal string, answer
#   end
# end


# ARRAY = ("A".."Z").to_a

#   def self.first_last_line(outside_spaces, inside_spaces, index)
#     puts " " * outside_spaces + ARRAY[index] + " " * inside_spaces + " " * outside_spaces + "\n"
#   end


#   def self.make_diamond(letter)
#     index = 0
#     outside_spaces = ARRAY.index(letter) # 2
#     inside_spaces = 0
#     #first_half
#     first_last_line(outside_spaces, inside_spaces, index)
#     loop do
#       puts " " * outside_spaces + ARRAY[index] + " " * inside_spaces + " " * outside_spaces + "\n"
#       index += 1
#       break if index == ARRAY.index(letter)
#     end
#     #second_half


#     first_last_line
#

class Diamond
  LETTERS = ("A".."Z").to_a
  def self.make_diamond(letter)
    @widest_letter = letter
    @num_top_layers = LETTERS.index(letter)
    @width = @num_top_layers * 2 + 1
    @diamond_arr = []
    self.create_top_layer
    self.create_middle_layer
    self.create_bottom_layer
    return @diamond_arr.join
  end

  private

  def self.create_top_layer
    @num_top_layers.times do |current_layer|
      outside_s = @num_top_layers - current_layer
      inside_s = @width - outside_s*2 - 2
      letter = LETTERS[current_layer]
      if current_layer > 0
        @diamond_arr << (" " * outside_s + letter + " " * inside_s + letter +
                         " " * outside_s + "\n")
      else
        @diamond_arr << (" " * outside_s + letter + " " * outside_s + "\n")
      end
    end
  end

  def self.create_middle_layer
    inside_s = @width - 2
    if inside_s > 0
      @diamond_arr << @widest_letter + " " * inside_s + @widest_letter + "\n"
    else
      @diamond_arr << @widest_letter + "\n"
    end
  end

  def self.create_bottom_layer
    layers = []
    @num_top_layers.times do |current_layer|
      layers << @diamond_arr.reverse[current_layer+1]
    end
    layers.each {|layer| @diamond_arr << layer}
  end
end
