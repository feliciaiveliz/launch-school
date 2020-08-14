=begin

Problem 1: Product Array (Array Series #5)
Problem 2: Nth Smallest Element (Array Series #4)
Problem 3: Minimum Steps (Array Series #6)
Problem 4: Maximum Gap (Array Series #4)

Given an array/list [] of integers, construct a product array Of same size such that prod[i] is equal to the product of all the elements of Arr[] except Arr[i].
Array/list size is at least 2 .
Array/list's numbers Will be only Positives
Repetition of numbers in the array/list could occur.

input: array of integers
output: array of integers, same size
rules:
- repeating numbers can occur
- array size will be at least 2
- only positive numbers in array
- current element is not included in product
data structure: array, integers
example: [12, 20] == [20, 12]
problem:
- What should be done with input?
  - start with first element
  - find product of all other elements
  - move to the next element
  - find product of all other elements
  - repeat process for whole collection
algorithm:
- create a new array
- create variable index set to 0
- create variable current_number set to 0
- delete current element and save to variable 
- loop:
- break if index + 1 is > to numbers size
- find product of all other elements, push to array
- insert deleted element back into array
- increment index by 1
- reassign current_number to next element in array (using index)
- repeat previous steps
=end

def product_array(numbers)
  products = []
  index = 0

  loop do 
    current_number = numbers.delete_at(index)
    products << numbers.inject(:*)
    numbers.insert(index, current_number)
    index += 1
    break if (index + 1) > numbers.size
  end
  products
end

# without modifiying original array

def product_array(numbers)
  products = []

  numbers.size.times do |idx|
    temp = numbers.dup
    temp.delete_at(idx)
    products << temp.inject(:*)
  end
  products
end

# shorter way

def product_array(numbers)
  product = numbers.inject(:*)
  numbers.map do |n|
    product / n
  end
end

p product_array([12, 20])
p product_array([3, 27, 4, 2])

# **********************************************
=begin

Given an array/list [] of integers , Find the Nth smallest element in this array of integers
Array/list size is at least 3 .
Array/list's numbers could be a mixture of positives, negatives and zeros.
Repetition in array/list's numbers could occur, so don't Remove Duplications.

input: array of integers, nth number
output: integer, the nth number of array
rules: 
- don't remove duplicate integers
data structure: array, integers
problem:
- sort the array smalles to largest
- find the nth integer in array
algorithm:
- call sort on the array
- take n elements from array
- return last element of the array returned by 'take'
=end

def nth_smallest(array, nth)
  array.sort.take(nth).last
end

def nth_smallest(array, nth)
  array.min(nth).last
end

p nth_smallest([3, 1, 2], 2) == 2
p nth_smallest([15, 20, 7, 10, 4, 3], 3) == 7
p nth_smallest([-5,-1,-6,-18], 4) == -1

# ********************************************
=begin

Given an array of N integers, you have to find how many times you have to add up the smallest numbers in the array until their Sum becomes greater or equal to K.
List size is at least 3.
All numbers will be positive.
Numbers could occur more than once, (Duplications may exist).
Threshold K will always be reachable.

input: array: integers, integer: value
output: integer: how many times it takes to reach value
rules: 
- may include duplicate
- list size will be at least 3
- add two smallest numbers, and keep adding numbers until value is reached
- return the number of times
data structure: array, integers
problem:
- What should be done with the input?
  - sort the array from smallest to largest
  - add first two numbers
  - check if sum >= value
    - if so, return the number
  - else, add the next number
  - repeat next steps
algorithm: 
- use #sort! for array
- create variable sum: use shift to get first element of array
- create variable count = 0
- create variable n = 0: keep track of array position
- return 0 if sum > value
- iterate until sum >= value:
  - increment sum by 'n'
  - increment count by 1
  - increment n by 1
=end
def minimum_steps(array, value)
  sum = array.sort!.shift
  return 0 if sum >= value
  count = 0
  n = 0

  until sum >= value
    sum += array[n]
    count += 1
    n += 1
  end

  count
end

p minimum_steps([4,6,3], 7) #== 1
p minimum_steps([10,9,9,8], 17) #== 1
p minimum_steps([8,9,10,4,2], 23) #== 3
p minimum_steps([19,98,69,28,75,45,17,98,67], 464) #== 8
p minimum_steps([4, 6, 3], 2) #== 0