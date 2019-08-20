# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

=begin

Inputs: 
- a positive integer

Output:
- a list of the digits in the number
- according to the example, it goes from an integer to an array of integers seperated by a comma and one space for each integer

Examples:
- puts digit_list(12345) == [1, 2, 3, 4, 5]
- puts digit_list(3) == [3]
- puts digit_list(43892) == [4, 3, 8, 9, 2]
- puts digit_list(777) == [7, 7, 7]

Rules: 
- When being compared, they must evaluate to true
- array must hold integer values
- cannot have negative numbers

Mental Model:
- an integer, 12345
- returns the list in array form: [1, 2, 3, 4, 5]

Data Structure: 
- array

Algorithm:
- create method called digit_list that takes one argument 'number'
- turn integer into a string- to_s
- split string into an array of strings of each integer as string
- convert each string into an integer to_i
=end


def digit_list(number)
    number.to_s.chars.map { |char| char.to_i }
end
    
p digit_list(12345)
p digit_list(43892)
p digit_list(777)
  
def digit_list(number)
  number.to_s.chars.map!(&:to_i) # refactored from above
end
  
p digit_list(12345)
p digit_list(43892)
p digit_list(777)
  