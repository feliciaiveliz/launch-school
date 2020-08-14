# Participating with Kris, Nick, Marcos, Alex, Felicia, Catherine

# 1st Example: 

a = 7

loop do 
  a = 5
  break
end

p a

# # 2nd Example:

a = "Bob"

5.times do |a|
  a = "Bill"
end

p a

# 20 minutes for solving a problem for the interview. 

# Write a method that takes in a number and returns a string, placing
# a dash in between odd digits.

=begin
input: integer
output: string
rules: 
- place a dash between odd numbers
- inputs will be valid positive integers only
data structure: string, array
algorithm: 
- convert the integer to a string to_s
- create an empty string
- iterate over the string 
  - if the number is even 
    - push the integer to the string
  - if the number is odd and the number at (index + 1) is also odd
  - push odd number
  - place a dash after it
  - push the next number
- continue for the rest of string
- return the string
=end

def dasherizer(integer)
  new_string = ""
  array = integer.to_s.chars
  
  array.each_with_index do |char, index|
    if char.to_i.even?
      new_string << char
    elsif char.to_i.odd? && array[index + 1].to_i.odd?
      new_string << char << "-" 
    else
      new_string << char
    end
  end
  new_string    
end

def dasherizer(integer)
  dash_string = ""
  array = integer.to_s.chars

  array.each_with_index do |char, index|
    if char.to_i.odd? && array[index + 1].to_i.odd? 
      dash_string << char << "-"
    else
      dash_string << char
    end
  end
  dash_string
end

p dasherizer(2112) == '21-12'
p dasherizer(201105742) == '201-105-742'
p dasherizer(123456789) == '123456789'
p dasherizer(21121) == '21-121'

