=begin

Example 1: 

Example 2: 

# You have to create a function that takes a positive integer number and returns the next bigger number formed by the same digits:

12 ==> 21
513 ==> 531
2017 ==> 2071

# If no bigger number can be composed using those digits, return -1:

# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(414) == 441
p next_bigger(144) == 414
p next_bigger(9) == -1
p next_bigger(111) == -1
p next_bigger(531) == -1

Example 3: 

1. Verbalize what's happening. Explain what you expected and what was actually output. Use plain english what you wanted to accomplish. 
2. 


# You have to create a function that takes a positive integer number and returns the next bigger number formed by the same digits:
#
# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
#
# If no bigger number can be composed using those digits, return -1:
#
# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

p next_bigger(12) #== 21
p next_bigger(513) == 531
# p next_bigger(2017) == 2071
# p next_bigger(414) == 441
# p next_bigger(144) == 414
# p next_bigger(9) == -1
# p next_bigger(111) == -1
# p next_bigger(531) == -1

Find the maximum number that can be found. 

input: integer
output: integer, maximum number
data structure: array, string
problem: 
- organize the numbers from smallest to largest
- return final number
algorithm: 
- put integers into an array
- sort integers b <=> a
- join integers into string, convert to integer
=end

def maximum_number(number)
  number.digits.sort { |a, b| b <=> a }.join.to_i
end

p maximum_number(513) == 531
p maximum_number(35231) == 53321
p maximum_number(7583) == 8753
p maximum_number(17) == 71
p maximum_number(5) == 5