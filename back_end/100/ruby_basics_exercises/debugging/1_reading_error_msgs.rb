# You come across the following code. What errors does it raise for the given examples and what exactly do the error messages mean?

def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

p find_first_nonzero_among([0, 0, 1, 0, 2, 0])
p find_first_nonzero_among([1])

#  1: from 1_reading_error_msgs.rb:11:in `<main>'
# 1_reading_error_msgs.rb:3:in `find_first_nonzero_among': wrong number of arguments (given 6, expected 1) (ArgumentError)