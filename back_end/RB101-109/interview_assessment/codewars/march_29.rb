=begin

input: string
output: hash
- key => integer
- value => array of single char strings
problem:
- what should be done with the input?
  - downcase the string
  - delete anything that's not a letter
  - tally up occurrences of each character in string
  - create the hash with keys as integers and values as array of chars
    - sort chars alphabetically
ALGORITHM:
- initialize 'result' to {}
- use #downcase to account for uppercase letters
- use #delete(/'^a-z'/) to delete anything not letter
- split string into chars using #chars and call #tally
  to get count of each character
- iterate over tallied 'hash', given key and value
  - create k, v pairs in 'result'
    - result[value] => [key]
- given result, iterate over 'result'
=end

def get_char_count(string)
  result = {}
  string.downcase!
  string.delete!('^0-9a-z')

  string.each_char do |letter|
    count = string.count(letter)
    if result.has_key?(count)
      result[string.count(letter)] << letter
    else
      result[string.count(letter)] = [letter]
    end
  end
  result.each_value do |value|
    value = value.uniq!
  end
  result.each_value do |value|
    value.sort!
  end
  result.sort_by { |count, _| count }.reverse.to_h
end

p get_char_count("Mississippi")
p get_char_count("Hello. Hello? HELLO!!")
p get_char_count("aaa...bb...c!")
p get_char_count("abc123")
p get_char_count("aaabbbccc")

def more_zeros(s)
  binary = 
  s = s.unpack('C*').map { |i| i.to_s 2 }  
  result = s.select do |string|
    string.count('0') > string.count('1')
  end
  result.map { |s| s.to_i }
end
