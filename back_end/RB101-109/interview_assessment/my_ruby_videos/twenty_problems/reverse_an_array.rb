=begin
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.
You may not use Array#reverse or Array#reverse!.

PROBLEM - 
input: array
output: array, reversed
question: what should be done with the input?
- remove last element and insert it at 0 index position
- remove last element and insert it at 1 index position, etc.
ALGORITM:
- use #size and #times to iterate: 
  - block parameter: 'index'
  - use #insert: pass in 'index' and array.pop
- return array
=end

def reverse!(array)
  array.size.times do |index|
    array.insert(index, array.pop)
  end
  array
end

p reverse!([1, 2, 3, 4]) == [4, 3, 2, 1]
p reverse!(['x', 'y', 'z']) == ['z', 'y', 'x']
p reverse!(['abc']) == ['abc']
p reverse!(%w(a b e d c)) == ['c', 'd', 'e', 'b', 'a']
