# 210524
# https://www.codewars.com/kata/5b1b27c8f60e99a467000041

# Given two words, how many letters do you have to remove from them to make them
#   anagrams?
#   Example
#   First word : c od e w ar s (4 letters removed)
#   Second word : ha c k er r a nk (6 letters removed)
#   Result : 10
#   Hints
#   A word is an anagram of another word if they have the same letters (usually in a different order).
#   Do not worry about case. All inputs will be lowercase.

=begin
input:
- two strings
output:
- integer- number of letters to remove to make both words anagrams of each other
rules:
- if there is two of the same letter in one word, only remove 1 letter
- if a letter occurs > 1 in a word, remove the letter
algorithm:
- initialize 'count' to 0
- iterate over first word and split into chars:
  - given letter:
    - if letter count > 1 and second word doesn't include letter
      - increment count by 1
    - else, skip letter
- end
- iterate over second word and split into chars:
  - if letter count > 1 and second word doesn't include letter
      - increment count by 1
    - else, skip letter
=end

def anagram_difference(a, b)
  count = 0

  a.each_char do |letter|
    count += 1 if b.count(letter) > 1 || !b.include?(letter)
  end

  b.each_char do |letter|
    count += 1 if a.count(letter) > 1 || !a.include?(letter)

  end

  count
end


p anagram_difference('codewars', 'hackerrank') == 10 #// 10
p anagram_difference("yraeiunvegmfzgxzqashjljkqvqpqvsakpfccxhynilzmywqmqwdhsadauqebaglwqzlgduyaoawdjuetq",
"jzfugfxajtpmqctphrmecklpkwfendpbjsxmqtqrzsfchicxkataczcsrqfildnvdrugbqhlykbcfffxdw") #== 50
