# Write a method that counts the number of occurences of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

=begin

Input: 
- array of 10 strings, seperated by a comma and single space saved to variable named vehicles

Output: 
- each element with the number of occurrences
- ex. car => 4

Mental Model: 
- The problem consists of an array of one or more random strings. Count the number of each occurence for that element and print out of list of the elements and their numbers

Examples:
- car => 4
- truck => 3
- motorcycle => 2
- SUV => 1

Data Structure: 
- Array#count method
- variables named after each element that occurs at least once

Algorithm: 
- create method called count_occurrences that takes one argument- vehicles
- initialize variables car, truck, motorcycle, and SUV
- call count method on vehicles array for each element, and save the return value of that method to the appropriate variable
- print each variable using puts "car => #{car}" 
=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# def count_occurrences(vehicles)

# end

# def count_occurrences(array)
#   array.uniq.each do |item|
#     puts "#{item} => #{array.count(item)}"
#   end
# end

def count_occurrences(arr)
  occur = Hash.new
  arr.each do |i|
    key = i.to_s
    if occur.has_key?(key)
      occur[key] += 1
    else 
      occur[key] = 1
    end
  end
  occur.each_pair { | key, value | puts "#{key} => #{value}"}
end



count_occurrences(vehicles)