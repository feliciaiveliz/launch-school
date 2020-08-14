# # Participating with Kris, Nicolas (interview today w/ Srdan), Marcos, Felicia, Srdan

# # Example 1:

# animal = "dog"

# loop do |_|
#   animal = "cat"
#   var = "ball"
#   break
# end

# puts animal # cat
# puts var # undefined local variable or method 'var' for main:Object

# # Example 2: 

# animal = "dog"

# loop do |animal|
#   animal = "cat"
#   break
# end

# puts animal # dog

# # Example 3: 

# def test(str)
#   str.upcase!
#   str += '!'
# end

# test_str = "Written Assessment"
# test(test_str)

# puts test_str # WRITTEN ASSESSMENT

# # Example 4: 

# def test
#   puts "written assessment"
# end

# var = test

# if var
#   puts "written assessment"
# else
#   puts "inteview"
# end

# # Example 5: Interview
# # Pay attention to test cases. Read all of them carefully.

# # Given the string of chars a..z A..Z do as in the sample cases

# # accum("abcd")    # "A-Bb-Ccc-Dddd"
# # accum("RqaEzty") # "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# # accum("cwAt")    # "C-Ww-Aaa-Tttt"

# ####################################################################  

# # You are given an array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# # You can asume there is never an empty array and there will always be an integer.

# p sum_consecutives([1,4,4,4,0,4,3,3,1]) == [1,12,0,4,6,1]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

=begin

input: array of integers
output: array of integers
rules: 
- array will always contain positive or negative integers
- array is never empty
- sum numbers that are same and consecutive
  - consecutive: the numbers one after the other are the same
- the rest of the numbers get added to the array as is
data structure: array
algorithm: 
- initialize variable integers, set to empty array
- create variable sum, set to 0
- if number and next number is same, add them together
  - increment sum by these numbers' sum
- if the next number is the same as the previous, add it to 'sum'
- until number is reached that isn't consecutive, repeat previous step
- otherwise, add the sum to the array
- reassign sum to the next set of numbers that need to be sumed
=end

# def sum_consecutives(array)
#   integers = []
#   arr.each_with_index do |element, index|
#     if index == 0
#       integers << []
#     else
#       if element == 
# def sum_consecutives(array)
#   integers = []

#   array.each
#   end
#   integers
# end

def sum_consecutives(array)
  result = []
  current = nil
  array.each do |number|
    if number == current
      result[-1] += number
    else
      current = number
      result << current
    end
  end
  result
end

p sum_consecutives([1,4,4,4,0,4,3,3,1])
p sum_consecutives([1,1,7,7,3])
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

[1, 2, 3].each do |num|
  
end