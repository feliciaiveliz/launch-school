=begin

Write a method that counts the number of occurrences of each element in a given array.
The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

input: array of strings
output: string 
rules: 
- words are case sensitive; 'suv' != 'SUV'
- word is on left side of => and number of occurrences on right
data structure: array, hash
pseudo-code: 
- create an empty hash to hold key value pairs that i will create
- iterate over vehicles array
- create key-value pair from array in the new hash, if the key doesn't exist yet, assign key to 1
- if the key value pair already exists, then add 1 to the value 
- iterate over the hash and output the values of the key-value pairs 
  - end method
algorithm: 
- define count_occurrences method that takes one parameter - array
- initialize empty hash occurrences_hash = {}
- iterate over array using #each and pass in each word to the block
- if key exists, then occurrences_hash[word] += 1
- else, create key occurrence_hash[word] = 1
- end #each iteration
- iterate over hash using #each, passing in the key, value
- use #puts within the block to output the value of the key and the value
=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  occurrences = array.tally 

  occurrences.each do |word, count|
    puts "#{word} => #{count}"
  end
end

count_occurrences(vehicles)

def count_occurrences(array)
  occurrences_hash = {}
  array.each do |word|
    if occurrences_hash.include?(word)
      occurrences_hash[word] += 1
    else
      occurrences_hash[word] = 1
    end
  end

  occurrences_hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

# LS

def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |word|
    occurrences[word] = array.count(word)
  end

  occurrences.each do |word, count|
    puts "#{word} => #{count}"
  end
end

# or refactored

def count_occurrences(array)
  array.uniq.each do |word|
    puts "#{word} => #{array.count(word)}"
  end
end


