=begin
Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

input: integer
output: integer
rules: 
- return index of first Fibonacci number that matches # of digits as argument
- first fibonacci number index is 1
- second index is 2, but integer element value is 1
- argument is greater than or equal to 2
algorithm: 
- define find_fibonacci_index_by_length(number_digits) method
- initialize variable 'first' and assign it to 1- represents first number
- initialize variable 'second' and assign it to 1- represents second number
- initialize variable 'index' and assign it to 2- we already have first 2 digits
- enter loop do 
  - increment index by 1- index += 1
  - assign to variable 'sum' = first + second (1 1 2)
  - break clause, if sum.to_s.size > number_digits
  - assign first number to second for next iteration
  - assign second number to result of sum
  - end loop
- return index of digit that matches argument size
- end method 
=end

def find_fibonacci_index_by_length(digits)
  first = 1
  second = 1
  index = 2

  loop do 
    index += 1
    sum = first + second
    break if sum.to_s.size >= digits

    first = second
    second = sum 
  end
  index
end

p find_fibonacci_index_by_length(2)     # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3)     # 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10)
p find_fibonacci_index_by_length(100)
p find_fibonacci_index_by_length(1000)
p find_fibonacci_index_by_length(10000)

