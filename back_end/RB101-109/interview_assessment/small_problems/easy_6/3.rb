=begin

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

input: integer
output: integer
rules: 
- argument is number of digits
- the first fib number that is == to digits 
  - return that index
- first fib number has index of 1
data structure: array, integer 
pseudo-code: 
- if number is less than 2, return 1
- create variable called 'first' that is assigned to 1
- create variable called 'second' that is assigned to 1
- create index variable to represent index of current fib number
- increment index by 1 to account the current fib number index
- create variable 'fibonacci' that is the sum of 'first' and 'second'
- if the 'fibonacci' number is the size of 'number' break
- return the index of that current 'fibonacci' number
algorithm:
- init. variable 'first' set it to 1
- inti. variable 'second' set it to 1
- init. variable 'index' set it to 2 (which is index of 'second')
- enter loop
- index += 1 to move to the next fibonacci index number which is (3)
- init. 'fibonacci' variable set it to first + second 
- if that sum (fib.to_s.size >= digits) break
- otherwise assign 'first' to 'second' and 'second' to 'fibonacci' 
  - to move up in the sequence
- if we break out of loop, return 'index'
=end

def find_fibonacci_index_by_length(digits)
  first = 1
  second = 1
  index = 2

  loop do 
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= digits

    first = second
    second = fibonacci
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847