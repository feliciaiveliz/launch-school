# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# I expect this code to print out: 

1
2
2
3

# Array#uniq returns a new array with the duplicate elements removed. In this problem, the #uniq method doesn't end with a !, therefore it is non-destructive. 
# Kernel#puts prints out the string value of each element on its own line, as opposed to printing it in its array form.

##############################################################################################################################################################

# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it?
2. put ! before somethng, like !user_name
3. put ! after something, like words.uniq!
4. put ? before something
5. put ? after something
6. put !! before something, like !!user_name

# Explanations: 
# * ! and ? are used as part of the method name. Some methods have them, and some don't be convention. It's not part of Ruby syntax.

# * != means not equal to. - != 0 means if something is not equal to 0
# * ? : is used in ternary operations for if/else statements - true ? "true" : "false"
# * ! turns any object into opposite of their boolean value. - !true == false
# * !! turns any object into boolean value - !!true == true
