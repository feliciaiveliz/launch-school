=begin

In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

input: integer, nth fibonacci number
output: integer, last digit on fibonacci number
rules: 
- use method from previous exercises to compute fib number
=end

def fibonacci(n)
  first = 1
  second = 1
  numbers = []
  numbers << first << second

  loop do 
    return 1 if n <= 2
    
    fibonacci = first + second
    numbers << fibonacci
    break if numbers.size == n

    first = second
    second = fibonacci
  end

  numbers.last
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

def fibonacci_last(n)
  last_2 = [1, 1]
  3.upto(n) do 
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4c