=begin
Problem 1: Count Odd numbers below n

Given a number n, return the number of positive odd numbers below n, EASY!

input: integer, starting number
output: array of integers, odd numbers below 'n'
rules: 
- odd numbers from 1 up to and not including 'n'
data structure: integers, array
algorithm: 
- create an empty array
- create a range from 1 to n
- iterate through the range 
- push only odd numbers to the array
- return the array
=end

def oddCount(n)
  odds = []
  (1..(n - 1)).each do |num|
    odds << num if num.odd?
  end
  odds
end

# Or

def oddCount(n)
  n / 2
end

p oddCount(7)
p oddCount(15)

=begin

Problem 2: Distinct Digit Year

The year of 2013 is the first year after the old 1987 with only distinct digits.
Now your task is to solve the following problem: given a year number, find the minimum year number which is strictly larger than the given one and has only distinct digits.

input: integer, year
output: integer, year
rules: 
- year will be larger than argument year
- will only have distint digits
- years will be > 1000 and <= 9000
example: 1987, 2013
algorithm:
- year is argument
- create a range from year to 9000
- increment through the years and check: 
  - if the year is greater than 'year'
  - if the year has unique digits
- return that year that satifies those conditions
=end

def distinct_digit_year(year)
  (year..9000).each do |num|
    return num if num > year && (num.digits.uniq == num.digits)
  end
end

p distinct_digit_year(1987)
p distinct_digit_year(2013)
p distinct_digit_year(2229)

=begin

Problem 3: Minimize Sum of Arrays

Given an array of integers , Find the minimum sum which is obtained from summing each Two integers product.

input: array of integers
output: integer, sum of products
rules: 
- find minimum sum of each integers' product
data structure: array
algorithm: 
- create an empty array
- sort the array, permenantly
- remove the first and last elements of the array, and multiply them
- push the product to the empty array
- continue until array is empty
=end

def min_sum(arr)
  out = []
  arr.sort! 
  
  out << arr.shift * arr.pop until arr.size == 0
  
  out.sum
end

p min_sum([5,4,2,3])

=begin

Problem 4: Form the Largest 

Given a number , Return _The Maximum number _ could be formed from the digits of the number given .

input: integer
output: integer
rules: 
- return the maximum number that can be formed from the number
data structure: array
algorithm: 
- put digits in an array
- sort the digits from largest to smallest 
- convert digits back to integers
=end

def max_number(n)
  n.digits.sort { |a, b| b <=> a }.join.to_i
end

=begin

Problem 5: Find the Divisors

Create a function named divisors/Divisors that takes an integer n > 1 and returns an array with all of the integer's divisors(except for 1 and the number itself), from smallest to largest. If the number is prime return the string '(integer) is prime'

input: integer
output: array of integers, divisors of 'n'
rules: 
- a prime number is a number that is only divisible by 1 and itself
- return "integer is prime" if it's prime
- 1 and 'n' are not included in list
data structure: array, integers
algorithm: 
- create an empty array to hold divisors
- create a range from 2 to 'n - 1' # 1 and 'n' are excluded
- if 'n' is divisible by current integer, push integer to array
- return array
- return "Integer is prime" if array is empty
=end

def divisors(n)
  divisors = []
  (2..(n - 1)).each do |num|
    if n % num == 0
      divisors << num
    end
  end
  return "#{n} is prime" if divisors.empty?
  divisors
end

# or

def divisors(n)
  divisors = (2..(n - 1)).select { |num| n % num == 0 }
  return "#{n} is prime." if divisors.empty?
  divisors
end

# Or

def divisors(n)
  n.prime? ? "#{n} is prime." : (2..(n - 1)).select { |num| n % num == 0 }
end

=begin

Problem 6: Find the Next Perfect Square

You might know some pretty large perfect squares. But what about the NEXT one?
Complete the findNextSquare method that finds the next integral perfect square after the one passed as a parameter. Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.
If the parameter is itself not a perfect square, than -1 should be returned. You may assume the parameter is positive.

input: integer
output: integer
rules: 
- a perfect square is created by two same whole numbers multiplied
- return -1 if 'n' is not perfect square
data structure: 
algorithm: 
- find sqrt of number
- if number is equal to the number rounded
  - it's a perfect square
  - otherwise return -1
- save that square root into variable sqrt
- start from sqrt += by 1 until we reach a perfect square
=end

def find_next_square(sq)
  n = Math.sqrt(sq)
  return -1 if n != n.round
  sqrt = n

  loop do 
    sqrt += 1 
    Math.sqrt(sqrt ** 2)
    break if sqrt == sqrt.round
  end
  sqrt ** 2
end

p find_next_square(625)

# 5/6 kyu

=begin

Problem 7: Multiples of 3 or 5

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
Note: If the number is a multiple of both 3 and 5, only count it once.

input: integer
output: integer, sum
rules: 
- find multiples of 3 or 5 below 'n'
- 'n' is not included in sum
- don't count a multiple of 3 and 5
data structure: integers
algorithm:
- create a range of numbers from 2 to 'n - 1'
- create a variable sum, set to 0
- iterate through range of numbers, incrementing 
  sum by multiples of 3 or 5
- return sum
=end

def solution(number)
  sum = 0
  (2..(number - 1)).each do |n|
    sum += n if (n % 3).zero? || (n % 5).zero?
  end
  sum
end

=begin

Problem 7: Delete a Digit

Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

input: integer
output: integer
rules: 
- delete only one integer
- preserve order of digits in number
data structure: array, string
algorithm:
- put integers into an array
- create an empty array
- iterate over the array of integers
- use index to keep track of the sections that will get pushed into array
  - delete the integer at 'index' and push to array
- convert that section back to integer
- retrieve the highest number from the array
=end

def delete_digit(n)
  array = []
  n.to_s.chars.each_with_index do |_, index|
    numbers = n.to_s.chars
    numbers.delete_at(index)
    array << numbers.join.to_i
  end
  array.max
end

p delete_digit(152)
p delete_digit(1001)
p delete_digit(10)

=begin

Problem 8: Alphabetized

Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!
The input is restricted to contain no numerals and only words containing the english alphabet letters.

input: string
output: a new string
rules: 
- remove all whitespace and punctuation
- input contains no numbers
- input contains only english alphabet letters
data structure: array, string
algorithm: 
- delete anything that's not a letter from the string
- create a variable called new_string
- convert string into an array of chars
- sort characters by 