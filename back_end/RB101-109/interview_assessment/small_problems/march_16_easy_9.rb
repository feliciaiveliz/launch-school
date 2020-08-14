=begin

Problem 1: Welcome Stranger

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

input: array, hash
output: string, greeting person with title/occupation
problem:
- reference the person's names/occupation and display a greeting to user
algorithm:
- use array element reference to retrieve person's names
- use keys in hash to access the person's title/occupation
- use #puts to display the welcome message
=end

# def greetings(array, hash)
#   "Hello, #{array[0]} #{array[1]} #{array[2]}! Nice to have a #{hash[:title]} #{hash[:occupation]} around!"
# end

# def greetings(array, hash)
#   "Hello, #{array.join(" ")}! Nice to have a #{hash[:title]} #{hash[:occupation]} around!"
# end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

=begin

Problem 3: Always Return Negative

Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

input: integer
output: 0 or negative number
algorithm: 
- if number is positive, return negative
- else return number
=end

def negative(n)
  n.positive? ? -n : n
end

p negative(5)
p negative(-3)
p negative(0)

=begin

Problem 4: Counting Up

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.
You may assume that the argument will always be a valid integer that is greater than 0.

input: integer
output: array, 1 to integer
algoritm:
- create range from 1 to integer
- invoke #to_a on range
=end

def sequence(n)
  (1..n).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

=begin

Problem 5: Uppercase Check

Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

input: string
output: boolean
algorithm: 
- compare current string with its uppercased version
=end

def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

=begin

Problem 6: How Long Are You?

Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.
You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

input: string
output: array of strings
problem:
- iterate through string:
  - create substrings of string and sizes
algorithm: 
- use #map to iterate:
  - pass current word to block
  - string interpolation
    - word + word size
- return array of words and sizes
=end

def word_lengths(string)
  string.split.map do |word|
    "#{word} #{word.size}"
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

=begin

Problem 7: Name Swapping

Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

input: string
output: new string
problem:
- switch first and last name and seperate with comma
algorithm:
- use #split:
  - use #reverse to switch name placements 
  - join to convert to string with ", " argument
=end

def swap_name(string)
  string.split.reverse.join(', ')
end

p swap_name('Joe Roberts')

=begin

Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.
You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

input: two integers
output: array of integers
problem: 
- second argument is starting number
  - find multiples of 'start' number and put into array
algorithm:
- initialize 'sequence' to []
- until the array size is equal to 'count'
- populate array with multiples
=end

def sequence(count, start)
  sequence = []
  multiple = 0

  until sequence.size == count
    sequence << multiple += start
  end
  sequence
end

def sequence(count, first)
  (1..count).map { |value| value * first }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

=begin

Problem 10: Grocery List => Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

input: array of arrays
output: array of strings (fruits)
problem: 
- iterate over larger array
  - put number of each fruit into its own array
  - return array of correct number of each fruit
algorithm: 
- use #map to iterate over array:
  - block parameter: inner_array
    - multiply fruit with quantity
- return array
=end

def buy_fruit(list)
  quantities = []
  list.each do |fruit, quantity|
    quantity.times do 
      quantities << fruit
    end
  end
  quantities
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
["apples", "apples", "apples", "orange", "bananas", "bananas"]
clear
