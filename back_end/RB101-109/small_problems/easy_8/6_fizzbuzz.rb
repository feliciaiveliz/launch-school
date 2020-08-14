=begin

Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

input: two integers
output: integers, strings
rules: 
- print numbers from starting point, to end point
- if num % 3 == 0, print "Fizz", if num % 5 == 0, print "Buzz"
- if num % 3 == 0 && num % 5 == 0, print "FizzBuzz"
examples: 
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
data structure: integer, if/else statement
algorithm: 
- define fizzbuzz(a, b)
- (a..b).each do |num|
- if num % 3 == 0 print "Fizz"
- elsif num % 5 == 0 print "Buzz"
- elsif num % 3 == 0 && num % 5 == 0 print "FizzBuzz"
- else print num
- end method
=end

def fizzbuzz(a, b)
  result = (a..b).to_a.map do |num|
    if (num % 3).zero? && (num % 5).zero?
      "FizzBuzz"
    elsif (num % 5).zero?
      "Buzz"
    elsif (num % 3).zero?
      "Fizz"
    else
      num
    end
  end
  result.join(", ")
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
