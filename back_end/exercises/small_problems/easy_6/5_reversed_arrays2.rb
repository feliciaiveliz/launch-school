=begin

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

input: array
output: new array
rules: 
- new array will contain elements of original array in reverse order
- cannot use Array#reverse or reverse!
- cannot use previous method
- do not modify original array
data structure: array
algorithm: 
- define reverse(array) method
- initialize empty array- new_array = []
- iterate over array using each 
- 'unshift' first element of array onto new_array
  - new_array.unshift(element)
  - continue for length of array
- end iteration method
- return new_array
- end method
=end

def reverse(array)
  new_array = []
  array.each do |element|
    new_array.unshift(element)
  end
  new_array
end

# First attempt at using Enumerable#inject:

def reverse(array)
  new_array = []

  array.inject do |new_array, element|
    new_array << element
  end
  new_array
end

# Working solution after looking for help: 

def reverse(array)
  array.inject([]) do |new_array, element|
    new_array.unshift(element)
  end
end

p reverse([1,2,3,4])       
p reverse(%w(a b e d c))
p reverse(['abc']) 
p reverse([])

p list = [1, 3, 2]                     
p new_list = reverse(list)              
p list.object_id != new_list.object_id  
p list == [1, 3, 2]                    
p new_list == [2, 3, 1]  

# Further Exploration

