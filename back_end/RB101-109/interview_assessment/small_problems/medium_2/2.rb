=begin

A collection of spelling blocks has two letters per block, as shown in this list:
This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.
Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

input: string, word
output: boolean
rules: 
- word can be uppercase/lowercase
- words can only be spelled with blocks that don't contain 
  both letters that are in the word
- BATCH: true- B:O, N:A, C:P, G:T, H:U
- BUTCH: false- B:O, H:U- this block contains both U and H
data structure: string, array, maybe hash
algorithm
- place blocks into a hash
  - hash: first letter => it's partner letter
- split the string into individual chars
- iterate over the array of chars
- start with first letter
  - search through the blocks and check if the letter exists in block, starting with first block
  - if it doesnt', move to the next block
  - if it does, check to see if it matches the first ond second letters
    - if it does, return false
    - if it doesn't, move on to the next letter
- second letter: 
  - start from the first block
  - repeat steps 4-8
=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze # array of strings

def block_word?(string)
  BLOCKS.none? { |block| string.upcase.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
