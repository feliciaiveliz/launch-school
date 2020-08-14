=begin

Rewrite your recursive fibonacci method so that it computes its results without recursion.

input: 
- integer (nth number in sequence)

output: 
- integer (number at the nth spot)

examples: 
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

algorithm: 
- define fibonacci(nth) method
- initialize array of numbers [1, 1] to first, last
- calculate each fib. number, updating the array in each iteration
- the array will contain each recent fib. number
- 3.upto(nth) { first, last = [last, first + last] }
- return last
=end

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) { first, last = [last, first + last] }
  last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501