=begin

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

input: integer
output: integer
rules: 
- double numbers are digits where the left and right side are the same
- they are even numbers
- if number is double-number, return number as is
- if number is not a double-number, mulitply number by 2
data structure: integer
pseudo-code: 
- convert integer into an array of integers
- if the number of integers in the array is odd, 
  - return the number times 2
- else if the number of integers in the array is even
- and if the number on left-side and right-side is same
  - return the number
- if the size of array is even and the sides are not equal
  - return the number times 2
algorithm: 
- convert the integer into an array of integers using #digits
- reverse the array since digits will put the digts in the array backwards
- find the size of the array using #size
- split the array into two arrays, one that contains the first half 
  - the other half contains the right side
- if left and right sides are equal, return number
- else, return number * 2
=end

def twice(number)
  digits = number.digits.reverse
  left, right = digits[0..((digits.size / 2) - 1 )], digits[((digits.size / 2))..-1]
  digits.size.even? && left == right ? number : number * 2
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

