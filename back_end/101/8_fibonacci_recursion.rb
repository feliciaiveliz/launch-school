=begin

Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

input: integer
output: integer
rules:  
- sum calls itself once, and uses a condition of n == 1 to stop
- n + sum(n - 1) uses return value of recursive call to compute a new return value
algorithm: 
- define fibonacci(n) method
- return 1 if n <= 2
- add fibonacci(nth - 1) + fibonacci(nth - 2)
=end

def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(1) 
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(12) 
p fibonacci(20)


5 - 1 = 4
5 - 2 = 3

4 - 1 = 3
3 - 2 = 1 
