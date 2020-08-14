# Part 1 of Watch Others Code

# Write a method that will determines whether an integer is a prime. Don't use the Prime Class.

# is_prime?(3) => true
# is_prime?(4) => false

=begin

input: integer
output: boolean
rules: 
- return true only if an integer is a prime number
- can't use Prime class
questions: 
- what is a prime number? 
  - a number that is only divisible by 1 and itself
- will integers be the only inputs? 
  - yes
- what should I do with 0?
  - return false
pseudo-code: 
- assign number to number converted to an integer
- use a range to capture values that start from 2 to one less than the number
- use guard clause for 1, return false if the number is equal to 1
- iterate over the values of 2 to (num -1, one less than the number)
- we will return false if the number is evenly divisible by the number passed to the block
  - if it equals 0, it is even divisible, which it means it is not prime
algorithm:
- define is_prime? method, pass in 'number' parameter
- num = num.to_i
- use a range to capture values from 2 to num - 1
- iterate over range using #each, passing in each number to the block
- return 'false' if number % i is equal to 0
- end #each method
- provide true statement to prevent the method from returning the original range value
- end method
=end

def is_prime?(number)
  number = number.to_i
  return false if number == 1

  (2..(number - 1)).each do |i|
    return false if number % i == 0
  end
  true
end

p is_prime?(3)
p is_prime?(4)

=begin

Write a method that will take an array of numbers, and only return those that are prime.

# select_primes([1, 2, 3, 4]) => [2, 3]
# select_primes([4, 6, 8, 10]) => []

input: array of numbers
outputs: array of only prime numbers
rules: 
- the array must only contain numbers that are prime
  - divisible by only 1 and itself
- 1 is not considered a prime number
- if the array doesn't contain prime numbers, return an empty array
- returned array must be a new array
data structure: array
pseudo-code: 
- given an array of integers: 
- iterate over the array and select the numbers that are prime
- check to see if number == 1, if it is, it is not prime
- if none are prime, return an empty array
- after iteration, return the array of prime numbers
algorithm: 
- define select_primes method, pass in array parameter
- iterate over array using #select and pass in each number to the block
- use is_prime?(number) method to check if the number is a prime
- if the block returns true for that iteration, select will put that number into a new array
- if false, select will not take that number
- return the new array at the end of iteration
=end

def select_primes(array)
  array.select do |number|
    is_prime?(number)
  end
end

p select_primes([1, 2, 3, 4])
p select_primes([4, 6, 8, 10])

=begin
Write a method that will take an array of numbers, and return the number of primes in the array.

input: array of numbers
output: integer to represent how many primes are in the array
rules: 
- 1 is not considered a prime number
- if no numbers are prime, return 0
data structure: array
pseudo-code: 
- given an array of integers: 
- using the two previous methods, iterate over the collection of integers
  - if the number is prime, it will be put into the new array
  - if not, it will not be selected
- end the iteration method
- return the return value of 'select_primes', passing in 'array'
- count the number of prime integers from this array and return that number
- end method
algorithm: 
- def count_primes(array)
- call select_primes(array) within the method
- invoke #count of the return value of select_primes(which is an array)
- this will return an integer that represents the number of primes
=end

def count_primes(array)
  select_primes(array).count
end

p count_primes([1, 2, 3, 4])
p count_primes([4, 6, 8, 10])

=begin

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

input: integer, string
output: integer
rules: 
- if 's', then sum all the numbers from 1 up to number
- if 'p' then multiply all the numbers from 1 up to the number
pseudo-code: 
- ask user for first number
- retrieve first number and save it into a variable
- convert that number to an integer
- ask user if they want to determine the sum or product of the numbers from 1 to the one they chose
- save input into a variable
- if 's', then add the numbers from 1 upto the number
- if 'p', then multiply the numbers from 1 upto the number
- display to user the result
algorithm: 
- print out a statement that asks user for number 
- save number into variable called 'number'
- convert number string into variable using #to_i
- print out a statement that asks a user to type 's' or 'p' depending on what they want
- save that result into a variable called 'input'
- if 's' then use #inject to sum up the numbers using a range
  - (1..number).inject(:+)
- if 'p' then use #inject to sum up the number using a range
  - (1..number).inject(:*)
- save the results into 'result'
- display results to the user use 'puts' in the conditional statements to output the result
=end

puts "Please type a number: "
number = gets.chomp.to_i

puts "Enter 's' to compute the sum or 'p' to compute the product: "
input = gets.chomp

if input == 's'
  result = (1..number).inject(:+)
  puts "The sum of the integers between 1 and #{number} is #{result}."
elsif input == 'p'
  result = (1..number).inject(:*)
  puts "The product of the integers between 1 and #{number} is #{result}."
end

def interleave(arr1, arr2)
  result = []
  length = arr1.size
  length.times do |i|
    result << arr1[i]
    result << arr2[i]
  end
  result
end

