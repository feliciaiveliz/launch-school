words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide', 
  'flow', 'neon']
  
result = {}

words.each do |word|
key = word.split('').sort.join
if result.has_key?(key)
result[key].push(word)
else
result[key] = [word]
end 
end

result.each_value do |v|
puts "------"
p v
end

# Iterate over array. 
# Organize keys in a hash, alphabetically sorted. 
# Value will be anagrams of the word
# if key exists, append current word into value (array)
# create new key, with this sorted word.

## practice this one, break it down