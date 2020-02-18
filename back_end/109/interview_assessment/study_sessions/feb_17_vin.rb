# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Examples:

# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true

=begin

input: string
output: boolean
rules: 
- a word can't contain both letters from a block
- account for upper/lower case letters
- each block only be used once
data structure: array, strings
problem: 
- puts blocks in an array, each block is a string
- iterate over blocks: 
  - count how many letters of a block are in string
  - if == 2 return false
  - true
algorithm: 
- creat an array of strings as blocks
- upcase word
- iterate over blocks:
  - count letters of block in str
  - return false if count == 2
- return true 
=end

BLOCKS = %w(B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M)

def block_word?(word)
  BLOCKS.each do |block|
    return false if block.count(word) == 2
  end
  true
end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

######################################################



# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.

=begin

input: string
output: box, lines are strings
data structure: strings
problem: 
- print 5 lines: 
  - 1st, 5th - same
  - 2nd, 4th - same
  - 3rd - string
  - is str empty, print empty str within box
algorithm:
- create 3 variables
  - top: print +, -, +
  - sides: print |, " ", |
  - middle: print |, string, |
- print top: +-, mutliply "-" by str size,-+
- print sides: |, multiply " " by str size, |
- print middle: |, print string, |
- print sides: |, multiply " " by str size, |
- print bottom: +-, mutliply "-" by str size,-+
=end

def print_in_box(string)
  size = string.size
  top = "+-#{"-" * size}-+"
  sides = "| #{" " * size} |"
  middle = "| #{string} |"
  
  puts top
  puts sides
  puts middle
  puts sides
  puts top
end

p print_in_box('To boldly go where no one has gone before.')
p print_in_box('')