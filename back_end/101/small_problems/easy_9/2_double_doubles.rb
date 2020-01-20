=begin
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

input: integer
output: integer
requirements: 
- double number is even-number digits number whose left-side digits == right-side digits
rules: 
- if number size is even, but left and right !=, then double the number
examples: 
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
data structure: array, integer, string
algorithm: 
- define twice method that passes in integer parameter
- convert integer to string, split string into array of strings(#chars), save to variable 'num_array'
- if size of array is odd?, integer * 2
- else if num_array.size is even?
  - middle = array.size / 2.0.ceil
  - left = array.slice(0, middle)
  - right = array.slice(middle, array.size - middle)
  - if left == right
    - integer
  - else if left != right
  - integer * 2
- end method
=end

def twice(integer)
  array = integer.to_s.chars

  if array.size.odd?
    integer * 2
  elsif array.size.even?
    middle = (array.size / 2.0).ceil
    left = array.slice(0, middle)
    right = array.slice(middle, (array.size - middle))
    
    left == right ? integer : integer * 2
  end
end

# refactored

def twice(num)
  str_num = num.to_s
  mid = str_num.size / 2

  str_num[0...mid] == str_num[mid..-1] ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
