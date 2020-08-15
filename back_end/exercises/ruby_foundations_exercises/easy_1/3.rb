# Find Missing Numbers

=begin
output: array of p missing integers
algo:
- define p missing method
- create 'results' empty array
- create a range from the first number to the last
- iterate over that range of all numbers
- if the current number is equal to a number from the argument array, skip it
- else add the number to the new array
- return array
=end

def missing(array)
  (array[0]..array[-1]).select { |n| n if !array.include?(n) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# LS

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end