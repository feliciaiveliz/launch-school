=begin

The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:
sum is a recursive method that computes the sum of all integers between 1 and n.
Recursive methods have three primary qualities:
They call themselves at least once.
They have a condition that stops the recursion (n == 1 above).
They use the result returned by themselves.
In the code above, sum calls itself once; it uses a condition of n == 1 to stop recursing; and, n + sum(n - 1) uses the return value of the recursive call to compute a new return value.
Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

input: integer, nth fibonacci number
output: integer, fibonacci number at nth position
rules:
- 1st place: 1
- 2nd place: 1 # 1 + 1 = 2
- 3rd place: 2
- 4th place: 3 # 2 + 1 = 3
- 5th place: 5
- 6th place: 8
- 7th place: 13
- 8th place: 21
- 9th place: 34
- 10th place: 55
- 11th place: 89
- 12th place: 144
first = 1
second = 1
fib = 2
numbers = [1, 1, 2, ]
first = 1
second = 2
fib = 3
numbers = [1, 1, 2, 3 ]
first = 2
second = 3
fib = 5
numbers = [1, 1, 2, 3, 5]
data structure: 
- array: index + 1 will give fibonacci position
algorithm: 
- return 1 if n < 2
- create an empty array to hold all fibonacci numbers
- use a loop to control number of iterations
- from 1 up to 'n'
- create a variable first = 1
- create a variable second = 1
- create a variable fibonacci = first + second
  - push this variable to numbers
- assign first to second 
- assign second to fibonacci
- loop through numbers until we reach 'n'
- return array
- return integer at 'n' index plus 1
- numbers.index(n + 1) => integer
=end

def fibonacci(position)
  first = 1
  second = 1
  numbers = []
  numbers << first << second

  loop do 
    return 1 if position <= 2
    
    fibonacci = first + second
    numbers << fibonacci
    break if numbers.size == position

    first = second
    second = fibonacci
  end

  numbers.at(position - 1)
end

# def fibonacci(n)
#   return 1 if n <= 2
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# Further Exploration



p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(100)
p fibonacci(100001)