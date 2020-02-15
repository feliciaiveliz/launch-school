=begin

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].

input: array of integers, integer- target
output: array of indices
rules:
- two numbers need to add up to target number
- don't use same element twice
examples:
- [2, 7, 11, 15], target = 9
problem:
- take target number, minus first num in array
  - if result is in array, find it's index, add to array
- if it isn't move on to next number
algorithm:
- create an empty array
- iterate: 
  - target - current num = result
  - if result is included in array, find it's index
  - push both num's indices into array
    indices << idx
  - filter out duplicates of array
- return array
=end

def two_sum(array, target)
  indices = []
  result = 0
  
  array.each do |n|
    result = target - n
    indices << array.index(n) << array.index(result) if array.include?(result)
  end
  indices.uniq
end


p two_sum([2, 4, 7, 11, 15], 9)# == [0, 2]



