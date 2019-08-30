### This file contains examples of specific concepts or things that I learned from the Small Problems exercises.

*30 August 2019*

Easy 5- 6. Letter Counter (Part 1):

My first attempt at the solution:

```ruby
def word_sizes(string)
  words_hash = {}
  words = string.split.sort_by! do |w|
    w.size
  end
  
  words.each do |word|
    words_hash[word.size] += 1
  end
  words_hash
end
```

LS Solution

```ruby
def word_sizes(string)
  words_hash = Hash.new(0)  # hash will start with default value of 0 instead of nil
  string.split.each do |word|
    words_hash[word.size] += 1
  end
  words_hash
end
```

TIL that initialiing an empty hash sets the default value as `nil`, and 1 cannot be added to `nil`. I also could refactor this
by not sorting the array by word sizes, and by `split` and `each` directly on the `string`. `words_hash[word.size] += 1` is still a little
difficult for me to understand clearly but this solution makes it more readable for me. This one utilizes the empty hash initialization.

```ruby

def word_sizes(string)
  words_hash = {}
  
  string.split.each do |word|
    size = word.size
    if words_hash.has_key?(size)
      words_hash[size] += 1
    else
      words_hash[size] = 1
    end
  end
  words_hash
end
```