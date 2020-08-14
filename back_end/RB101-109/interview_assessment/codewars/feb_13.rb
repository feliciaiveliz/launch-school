=begin

Problem 1: Break camelCase || 6 kyu

Complete the solution so that the function will break up camel casing, using a space between words.

input: string
output: new string
rules:
- insert space before capital letter in string
data structure: array, string
example: solution("camelCasing") == "camel Casing"
problem: 
- What do I want to do with the input?
  - iterate over the string
  - check if letter is a capitalized letter
  - if it is, insert a space before it
  - if it's not, iterate until one is found
algorithm:
- create an empty array
- create array of capital letters
- split string into array of chars
- iterate over words and check if char is included in cap. letters array
  - if it is, insert space at index before current char
- return array and join it into a string
=end

def solution(string)
  string.chars.map do |char|
    char == char.upcase ? " #{char}" : char
  end.join
end

p solution('camelCasing')

def no_boring_zeros(number)
  count = 0
  digits = number.abs.digits.reverse

  until digits.last != 0
    digits.pop 
    count += 1
  end
  
  return -digits.join.to_i if number < 0
  digits.join.to_i
end

p no_boring_zeros(1450)
p no_boring_zeros(1050)
p no_boring_zeros(960000)
p no_boring_zeros(-1050)

# Problem 3: Watermelon

def divide(weight)
  (weight - (weight / 2)).floor.digits.uniq.join.to_i
end

p divide(100)

# Problem 4: Complete the Pattern #1

=begin

You have to write a function pattern which returns the following Pattern(See Pattern & Examples) upto n number of rows.

input: integer
output: string
rules: 
- return number printed 'n' times
- print newline when '\n'
examples: 
- pattern(5):
1
22
333
4444
55555
- (pattern(2),"1\n22")
problem: 
- What do I want to do with input?
  - mutiply number by 'n' times
  - print each number on its own line
algorithm: 
- from 1 up to 'n'
  - convert number into string
  - mutiply number by 'n' times
=end

def pattern(n)
  (1..n).map { |i| ((i.to_s) * i) }.join('\n')
end

# Problem 5: Product Of Maximums Of Array (Array Series #2)

=begin

Given an array/list [] of integers , Find the product of the k maximal numbers.

input: array of integers
output: integer
rules: 
- array size at least 3
- digits will be positive, negative, zero
- repetition of digits will occur
example: 
- maxProduct ({4, 3, 5}, 2) ==>  return (20)
- maxProduct ({8, 10, 9, 7}, 3) ==>  return (720)
data structure: array, integers
problem: 
- What do I want to do with input? 
  - sort array from smallest to largest
  - remove 'n' number of digits from end of array
  - multiply them together
  - return product
algorithm:
- sort array
- pop off 'n' digits from array and multiply them 
- return integer product
=end

def max_product(n, size)
  n.sort!.pop(size).inject(:*)
end

p max_product([8, 10 , 9, 7], 3)
p max_product([10, 8, 3, 2, 1, 4, 10], 5)

# Problem 6: Alphabetized

=begin
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!
The input is restricted to contain no numerals and only words containing the english alphabet letters.

input: string
output: new string
rules: 
- case insensitive
- order alphabetically
- order in order-of-appearance
example: 
- alphabetized("The Holy Bible") # "BbeehHilloTy"
data structure: array, string
problem: 
- What do I want to do with the input? 
  - find all uppercase and lowercase letters
  - sort them by alphabetical order
alogithm: 
=end

def alphabetized(string)
  string.scan(/[a-z]/i).sort_by { |letter| letter.downcase }.join
end

p alphabetized("The Holy Bible") == "BbeehHilloTy"

def string_expansion(string)
  letters = ('a'..'z').to_a
  numbers = '0123456789'
  number = 1
  result = []

  string.chars.each do |char|
    if numbers.include?(char)
      number = char.to_i
    elsif letters.include?(char.downcase)
      result << char * number
    end
  end

  result.join
end

p string_expansion('3D2a5d2f') #== 'DDDaadddddff'