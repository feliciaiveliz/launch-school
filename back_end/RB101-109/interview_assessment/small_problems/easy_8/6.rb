=begin

Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

input: two integers, starting and ending number
output: all number between starting and ending number
rules: 
- print out all numbers except: 
  - if number is divisible by 3 and 5, print "FizzBuzz"
  - if number divisible by 5 print "Buzz"
  - if number divisible by 3 print "Fizz
data structure: integer, string
pseudo-code: 
- capture values from 1 to the ending number
- if number divisible by 15 print "FizzBuzz"
- elsif number divisible by 5 print "Buzz"
- elsif number divisible by 3 print "Fizz"
- else print number
algorithm: 
- from 1 up to ending number
- if num % 15 == 0
  - puts "FizzBuzz"
- elsif num % 5 == 0
  - puts "Buzz"
- elsif num % 3 == 0
  - puts "Fizz"
- else 
  - puts number
=end

def fizzbuzz(a, b)
  string = []
  a.upto(b) do |i|
    if i % 3 == 0 && i % 5 == 0
      string << "FizzBuzz"
    elsif i % 5 == 0
      string << "Buzz"
    elsif i % 3 == 0
      string << "Fizz"
    else
      string << i
    end
  end
  string.join(", ")
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
