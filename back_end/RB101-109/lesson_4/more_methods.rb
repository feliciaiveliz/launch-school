# 1. What is the return value of the select method below? Why?
# Answer: [1, 2, 3]. 'hi' is a string and it's a truthy value. Select selects items based on the truthiness
# of the blocks return value. 'hi' is always a truthy value, so select will return a new array with the original elements.
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# 2. How does count treat the block's return value? How can we find out?
# According to Ruby Docs, count returns an integer whether it is provided an argument, a block, or none.
# If a block, it will return the number of elements for when it yields a true value, so count considers the 'truthiness of the block's return value.
# Answer: 2.
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end 

# 3. What is the return value of reject in the following code? Why?
# Answer: [1, 2, 3]. puts always returns nil. reject returns a new array containing items for which the block's return value is 'falsey'. Since
# puts num returns nil, nil is falsey thus the original elements are returned in a new array.
[1, 2, 3].reject do |num|
  puts num
end

# 4. What is the return value of each_with_object in the following code? Why?
# => {'ant', 'bear', 'cat'}
# Answer: { "a" => "ant", "b" => "bear", "c" => "cat" }
# We pass in {} as an argument, which then passed to the block. The value parameter represents the current element in the array. It adds key-value
# pairs and returns it.
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# 5. What does shift do in the following code? How can we find out?
# Check Ruby Docs. It returns the key-value pair from the hash in an array form. The original hash is mutated.
# Answer: [a: 'ant']
hash = { a: 'ant', b: 'bear' }
hash.shift

# 6. What is the return value of the following statement? Why?
# Answer: 11. pop is being called on the array, which removes the last element from the array and returns it. size is called on the return value of calling
# pop on the array, and that returns and integer value of the length of the string that was returned.
['ant', 'bear', 'caterpillar'].pop.size

# 7. What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?
# Answer: block's return value: boolean, any? return value: true, will output 1.
# The return value of the block is determined by the last expression within the block. num.odd? returns a boolean. The block's return value is 
# either going to be true or false. any? returns true if the block ever returns a true value. any? stops after it reaches the first true value.
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# 8. How does take work? Is it destructive? How can we find out?
# Answer: Check docs. It is not destructive. It takes the first (n) elements from the array and returns it in array form. 

arr = [1, 2, 3, 4, 5]
arr.take(2)

# 9. What is the return value of map in the following code? Why?
# Answer: ['bear']. It returns an array of the results of running the block once for each element.
# Answer: [nil, 'bear']. The return value of map always is an array. When none of the conditions in an if statement evals as true, the if statement
# itself returns nil. 
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# 10. What is the return value of the following code? Why?
# Answer: [1, nil, nil]. Got it right!! The first element (b/c of the if statement) evals to false, so the else branch code is run. 
# In that case, the return is the number itself. For 2 and 3, the 'if' code is ran and puts always returns nil so that is what is returned 
# as the last statement in the block. 
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
