# Question 1: What would you expect the code below to print out?

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

########################################################################################################################################################################

# Question 2: Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

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

########################################################################################################################################################################

# Question 3: Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# Code:
advice.gsub!('important', 'urgent') => "Few things in life are as urgent as house training your pet dinosaur."
use .sub! to replace first occurrence of given string.

# Explanation: 
# String#gsub! is a desctructive method that permanently mutates the string by substitutes all occurrences of the given string. gsub!(pattern, replacement) => str or nil
# The first string specified is the one that needs to be replaced by the second string.

#########################################################################################################################################################################

# Question 4: The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
# delete_at is a method that deletes the value at that index in the array, in this case 2, and returns it. Returns nil if index does not exist. numbers = [1, 3, 4, 5]
numbers.delete(1)
# delete is a method that deletes all the values that match the specified argument, in this case 1, and returns it. numbers = [2, 3, 4, 5]
#Both arrays are operated on directly and are modified in-place.

#########################################################################################################################################################################

# Question 5: Programmatically determine if 42 lies between 10 and 100.

1. (10..100).cover?(42) => true
# Range#cover?(obj) => true or false
# This method returns true if obj is between the beginning and end of the range

#########################################################################################################################################################################

# Question 6: Starting with the string: , show two different ways to put the expected "Four score and" in front of it.

famous_words = "seven years ago..."

famous_words.insert(0, "Four score and ") - String#insert - insert(index, other_str) => str 
# This insert other_str before the given index in the string. Negative indices count backwards from the end of the string and other_str is inserted after the index. 

"Four score and " + famous_words

famous_words.prepend("Four score and ")

"Four score and " << famous_words

#########################################################################################################################################################################

# Question 7

def add_eight(number)
    number + 8
end
  
number = 2
  
how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }
  
p how_deep
  
p eval(how_deep) => 42  #**don't understand, come back to it

#########################################################################################################################################################################

# Question 8: If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

flintstones.flatten!

#########################################################################################################################################################################

# Question 9: Given the hash below:

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number.

flintstones.assoc("Barney")

