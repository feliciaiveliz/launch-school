# 1. Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hsh = {}

flintstones.each_with_index do |item, index|
  flintstones_hsh[item] = index
end

p flintstones_hsh

# 2. Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum
p ages.values.inject(:+)

# 3. In the age hash throw out the really old people (age 100 or older).
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select do |key, value|
  value < 100
end

ages.reject! do |key, value|
  value > 100
end

ages.keep_if do |key, value|
  value < 100
end

# 4. Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# 5. In the array find the index of the first name that starts with "Be"
My solution: 
flintstones.find_index { |name| name.start_with?("Be") }

# LS solution: 
flintstones.index { |name| name[0, 2] == 'Be' }

# 6. Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each do |name|
  name.slice!(3..name.size)
end

flintstones.map! do |name|
  name[0, 3]
end

p flintstones

# 7. Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
# Wrong. Each letter, not all characters. 
hash = {}
statement.chars.uniq.each do |item|
  hash[item] = statement.count(item)
end

p hash

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# 8. What happens when we modify an array while we are iterating over it? What would be output by this code?
Answer(1): 1, 3 => [1, 3]/ Answer(2): 1, 2 => [1, 2]
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]

numbers.each do |number|
 p number
 numbers.pop(1)
end

# 9. As we have seen previously we can use some built-in string methods to change the 
# case of a string. A notably missing method is something provided in Rails, but not in 
# Ruby itself...titleize. This method in Ruby on Rails creates a string that has each 
# word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"
words.split.map! { |word| word.capitalize }.join(' ')

# 10. Modify the hash such that each member of the Munster family has an additional 
# "age_group" key that has one of three values describing the age group the family 
# member is in (kid, adult, or senior). Your solution should produce the hash below
# Ex. 
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster, details|
  case details['age']
  when 0...18
    details['age_group'] = 'kid'
  when 18...65
    details['age_group'] = 'adult'
  else
    details['age_group'] = 'senior'
  end
end

p munsters





