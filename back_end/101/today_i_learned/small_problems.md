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

* September 1, 2019*
* Updating for yesterday*

Easy 6- 1. Cute Angles

My Attempt at Solution:
```ruby
# DEGREE = "\xC2\xB0"
def dms(number)
degree = number.divmod(1).first      
minutes = number.divmod(1).last * 60
seconds = minutes.divmod(1).last * 60
"#{format('xC2xB0', degree)}#{format('%02d', minutes)}#{"'"}#{format('%02d', seconds)}"
end
```

LS Solution: 

```ruby
DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
```

Yesterday I learned how `divmod` is used. I've seen it before but never really understood how it worked, even with reading Ruby Docs and seeing examples. At first I couldn't understand the problem, so I had to research the 'math' needed to figure out degrees, minutes, and seconds. I'm sure my solution isn't the most elegant, but it works and is more readable and understandable for me at the moment. The only part that doesn't work for me is the formatting. I need to learn how it works. FOr whatever reason, in my terminal, it won't format properly. All the numbers are correct, but instead of showing the degree symbol, it shows a bunch of slash marks and letters.  

* September 25th, 2019 - Wednesday

Easy 9 - Problem 8 - Sequence Count

I learned that ranges have access to `Enumerable` methods such as map. It will be treated as an array and won't have to be converted. 

Example: 

```ruby
(1..5).map { |num| num }
=> [1, 2, 3, 4, 5]
```

Super cool! 