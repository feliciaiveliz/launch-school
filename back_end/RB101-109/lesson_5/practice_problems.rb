# Practice Problems

# 1. How would you order this array of number strings by descending numeric value?

# arr = ['10', '11', '9', '7', '8']

# # My attempt: 
# arr.map do |string|
#   string.to_i
# end

# arr.sort do |a, b|
#   b <=> a
# end

# # LS 
# arr.sort! do |a, b|
#   b.to_i <=> a.to_i
# end

# p arr

# 2. How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# books.sort_by! do |book|
#  book[:published]
# end

# p books

# 3. For each of these collection objects demonstrate how you would reference the letter 'g'.

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# p arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# p arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# p arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# p hsh1['b'][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p hsh2[:third].key(0)

# 4. For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

# arr1 = [1, [2, 3], 4]

# arr1[1][1] = 4

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# arr2[2] = 4

# hsh1 = {first: [1, 2, [3]]}

# hsh1[:first][2] = [4]

# p hsh1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# hsh2[['a']][:a][2] = 4

# p hsh2

# 5. Figure out the total age of just the male members of the family.

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# total_male_age = 0

# munsters.each_value do |munster|
#   total_male_age += munster['age'] if munster['gender'] == 'male'
# end

# p total_male_age

# 6. Given this previously seen family hash, print out the name, age and gender of each family member:

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |munster, details|
#   puts "#{munster} is a #{details['age']}-year-old #{details['gender']}."
# end

# 7. Given this code, what would be the final values of a and b? Try to work this out without running the code.

# a = 2          # a is pointing to integer object whose value is 2
# b = [5, 8]     # b is pointing an array with integers objects whose values are 5 and 8
# arr = [a, b]   # arr is pointing to an array with objects a and b- arr = [2, [5, 8]]

# arr[0] += 2    # arr = [4, [5, 8]]
# arr[1][0] -= a  

# arr = [4, [3, 8]]
# a = 2
# b = [3, 8]

# 8. Using the each method, write some code to output all of the vowels from the strings.

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# vowels = 'aeiou'

# hsh.each do |_, array|              # iterate over each k, v pair
#   array.each do |string| 
#     string.chars.each do |char|
#       p char if vowels.include?(char)
#     end
#   end
# end
         
# 9. Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# arr.map do |array|
#   array.sort! do |a, b|
#     b <=> a
#   end
# end

# p arr

# 10. Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# # output: [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

# array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# array.map do |hash|
#   incremented_hash = {}
#   hash.each do |key, value|
#     incremented_hash[key] = value += 1
#   end
#   incremented_hash
# end

# 11. Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |array|
  array.select do |num|
    num % 3 == 0
  end
end

# 12. Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
  
new_hash = {}
arr.each do |element|
  new_hash[element[0]] = element[1]
end
  
p new_hash

# 13.Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |subarray|
  subarray.select do |integer|
    integer.odd?  
  end
end

# 14. Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

# return new array
# for fruits, return Capitalized Colors
# for vegetables, return UPPERCASE SIZES

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |key, value|
  if hsh[key][:type] == 'fruit'
    hsh[key][:colors].each do |string|
      string.capitalize!
    end
  else
    hsh[key][:size].upcase!
  end
end

# Cleaned-up version

hsh.map do |key, value|
  if value[:type] == 'fruit'
    value[:colors].each do |color|
      color.capitalize!
    end
  else
    value[:size].upcase!
  end
end

# 15. Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.map do |hash|
  hash.select do |_, array|
    array.all? do |num|
      num.even?
    end
  end
end

arr.select do |hash|
  hash.all? do |_, array|
    array.all? do |num|
      num.even?
    end
  end
end

# 16. Write a method that returns one UUID when called with no parameters.

def generate_UUID
  CHARACTERS = %(0 1 2 3 4 5 6 7 8 9 a b c d e f)

  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += CHARACTERS.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

generate_UUID