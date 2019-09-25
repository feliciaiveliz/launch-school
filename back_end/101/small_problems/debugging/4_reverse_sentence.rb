=begin

The reverse_sentence method should return a new string with the words of its argument in reverse order, without using any of Ruby's built-in reverse methods. However, the code below raises an error. Change it so that it behaves as expected.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

Output: 
Traceback (most recent call last):
        2: from 4_reverse_sentence.rb:38:in `<main>'
        1: from 4_reverse_sentence.rb:31:in `reverse_sentence'
4_reverse_sentence.rb:31:in `+': no implicit conversion of Array into String (TypeError)
=end

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = words.size - 1
  while i >= 0
    reversed_words << words[i]
    i -= 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length # words[i].+(reversed_words)
    reversed_words = [words[i]] + reversed_words  # turn words[i] into an array to add it to reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# or to make life easier

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.unshift(words[i]) # this prepends the word at the beginning of the array
    i += 1
  end

  reversed_words.join(' ')
end