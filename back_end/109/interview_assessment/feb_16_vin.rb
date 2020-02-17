# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

# Examples:

# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true 

=begin

input: string
output: boolean
rules: 
- true if all chars are uppercase
- ignore non-letters
data structure: string
problem: 
- What do i want to do with the input?
  - compare the original string with its upcased version
  - it will return true if it's the same
algorithm:
- compare original str with upcased version
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

# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Examples

# multisum(3) == 3 # 3
# multisum(5) == 8 # 3 + 5
# multisum(10) == 33 # 3 + 5 + 6 + 9 = 10 
# multisum(1000) == 234168

=begin

input: integer
output: integer
rules:
- multiple: a num that can be evenly divided into anothr number
- mult. of 3 or 5
- start number: 1, end number: target number
- if a mult. occurs for both integers, include only once
- assume that integer > 1
problem: 
- given a target number: 
  - create a range from 1 to target number
  - iterate over the range
    - check: 
      - if current num is mult. of 3 or 5, add it to a sum
    - continue for the length of range
- return the sum
algorithm: 
- create range, from 1 up to target
- create a variable sum set it to zero
- iterate: 
  - check if num is divisible by 3 or 5
  - if it is, add it to sum
- return sum
=end

def multisum(target)
  sum = 0
  1.upto(target) do |n|
    sum += n if n % 3 == 0 || n % 5 == 0 
  end
  sum
end

p multisum(3) # == 3 # 3
p multisum(5) # == 8 # 3 + 5
p multisum(10) #== 33 # 3 + 5 + 6 + 9 = 10 
p multisum(1000)# == 234168#

# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:

# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
# Sequences like this translate naturally as "recursive" methods. A recursive method is one in which the method calls itself. For example:

# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end

# sum is a recursive method that computes the sum of all integers between 1 and n.

# Recursive methods have three primary qualities:

# They call themselves at least once.
# They have a condition that stops the recursion (n == 1 above).
# They use the result returned by themselves.
# In the code above, sum calls itself once; it uses a condition of n == 1 to stop recursing; and, n + sum(n - 1) uses the return value of the recursive call to compute a new return value.

# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2 # 1 + 1: 2
# fibonacci(4) == 3 # 1 + 2: 3
# fibonacci(5) == 5 # 2 + 3: 5
# fibonacci(12) == 144
# fibonacci(20) == 6765

=begin

input: integer 'nth'
output: integer
rules:
- first two nums are 1
- add two previous nums, get result
- use result + previous num to get next result
data structure: array, integer
problem: 
- calculate fib. number results, put them into a collection
- retrieve the number at the nth position
algorithm: 
- create an array with 1 and 1 
- create variable first, second, fibonacci
- create a loop: 
  - assign first to 1
  - assign second to 1
  - assign to fib. first + second
  - push the result to the array
  - increment first, second, fib.
  - break if the array size is equal to nth number
- retrieve the nth number from array using index
=end

def fibonacci(nth)
  sums = [1, 1]
  first = 1
  second = 1
  fibonacci = 0
  
  loop do 
    return 1 if nth <= 2
    
    fibonacci = first + second 
    sums << fibonacci
    break if sums.size == nth
    
    first = second
    second = fibonacci
  end
  
  sums.at(nth - 1)
end

def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

# def fibonacci(position)
#   first = 1
#   second = 1
#   numbers = []
#   numbers << first << second

#   loop do 
#     return 1 if position <= 2
    
#     fibonacci = first + second
#     numbers << fibonacci
#     break if numbers.size == position

#     first = second
#     second = fibonacci
#   end

#   numbers.at(position - 1)
# end

p fibonacci(1) #== 1
p fibonacci(2) #== 1
p fibonacci(3) #== 2 # 1 + 1: 2
p fibonacci(4) #== 3 # 1 + 2: 3
p fibonacci(5) == 5 # 2 + 3: 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
    