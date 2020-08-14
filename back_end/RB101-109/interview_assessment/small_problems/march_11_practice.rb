def ascii_value(string)
  sum = 0
  string.each_char do |letter|
    sum += letter.ord
  end
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# swap first and last letters of each word
# split str into arr of words
# assign word[0] to word [-1] and vice versa
# join into string

def swap(str)
  str.split.map do |word| 
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') == 'a'

def cleanup(string)
  string.gsub(/[^a-zA-Z]/, " ").squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '

def word_sizes(string)
  string.split.map { |word| word.size }.tally
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

def word_sizes(string)
  string = string.delete('^a-zA-Z ')
  string.split.map { |word| word.size }.tally
end

def word_sizes(string)
  counts = Hash.new(0)
  string.split.each do |word|
    word = word.delete('^a-zA-Z')
    counts[word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

def crunch(string)
  crunched = ""

  string.each_char do |char|
    crunched << char unless crunched[-1] == char
  end

  crunched
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''