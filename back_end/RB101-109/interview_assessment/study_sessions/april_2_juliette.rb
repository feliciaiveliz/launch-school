# Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

# You may assume no duplicates in the array.

=begin

input: array of integer, target number
output: integer, index of target if found, otherwise index where it would be inserted in order
problem:
- find index of target number
- if we try to find an index and the return value is nil, then we need to return an index where it would be
- put integer into array where it should be
  - find the index
ALGO:
- use #index on array and pass in integer
- if the return value is nil, insert the number:
  - initialize 'inserted_number' to target
  - iterate over array, with index given integer:
    - if number is 0, insert it at beginning
    - otherwise current number is one less than 'inserted_number'
      - insert the number after current number
- return index of target number
=end

def search_insert(array, target)
  if array.index(target) != nil
    return array.index(target)
  else
    array.each_with_index do |number, index|
      if target == 0
        array.insert(0, target)
        return array.index(target)
      else
        if (target - number == 1)
          array.insert(index + 1, target) 
          return array.index(target)
        end
      end
    end
  end
end

def search_insert(nums, target)
  nums.each_with_index { |num, i| return i if num >= target }
  nums.size
end

p search_insert([1, 3, 5, 6], 5) == 2
p search_insert([1, 3, 5, 6], 2) == 1
p search_insert([1, 3, 5, 6], 7) == 4
p search_insert([1, 3, 5, 6], 0) == 0

# Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

# You may assume no duplicates in the array.


=begin

input: array of integers
output: target integer
problem:
- return index if number is found in the array
- otherwise, iterate over array and check:
  - if current number is greater than or equal to target
  - return index of current number
ALGO:
- use #each_with_index and pass in number and index
  - if current number >= target
    - return index
    
=end

def search_insert(array, target)
  array.each_with_index do |n, idx|
    if n >= target
      return idx
    end
  end
  array.size
end

p search_insert([1, 3, 5, 6], 5) == 2
p search_insert([1, 3, 5, 6], 2) == 1
p search_insert([1, 3, 5, 6], 7) #== 4
p search_insert([1, 3, 5, 6], 0) == 0

# Given a signed integer, reverse digits of an integer.

=begin

input: integer, positive or negative
output: reversed integer
problem:
- reverse the integer without leading zeros:
- if number is negative, find abs value of number
  - put integers into an array
  - if the array starts with zeros, delete them
  - convert back to integer 
  - insert negative sign at start of number
- return number
ALGO:
- initialize 'number'
- if number is < 0, use #abs to find abs value
  - save to number
- number: use #digits on 'n' 
- if number (array) starts with zero, #shift until number is not
zero
- use #join to convert to string, #to_i
- if 'n' -number
- return 'number'
=end

def reverse(n)
  number = n.abs.digits.join.to_i
  n < 0 ? -number : number
end

p reverse(123)  == 321
p reverse(-123) == -321
p reverse(120)  == 21
p reverse(2_147_483_640) == 463_847_412
p reverse(2_147_483_600)== 63_847_412
