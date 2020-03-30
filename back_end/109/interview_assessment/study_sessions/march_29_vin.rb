# The objective is to return all pairs of integers from a given collection of integers that have a difference of 2.

# The result should be sorted in ascending order.

# The input will consist of unique values. The order of the integers in the input collection should not matter.

=begin

input: array of integers
output: all pairs of integers that have a difference of 2
problem:
- what should be done with the input?
  - sort integers from smallest to largest
  - create 'all_pairs' array (larger array)
  - iterate over input array: 
    - take pairs from input array, add to 'all_pairs' array
    - create pairs, add all pairs to 'all_pairs'
- iterate over the pairs and check if 'b' - 'a' is 1
        - if yes, select the pair
ALGORITHM:
- intiialize 'pairs' (larger array)
- initilaze 'all_pairs' (result array)
- sort array using #sort!
- given 'pairs':
  - iterate using #select:
    - given pair: if array[1] - array[0] == 1, select pair
- iterate over 'all_pairs' using #sort_by: pass pairs to block
  - sort array based on first numner of array: array[0]
=end

# [1, 2, 3, 4]      -->  [[1, 3], [2, 4]]
# [4, 1, 2, 3]      -->  [[1, 3], [2, 4]]
# [1, 23, 3, 4, 7]  -->  [[1, 3]]
# [4, 3, 1, 5, 6]   -->  [[1, 3], [3, 5], [4, 6]]

def twos_difference(array)
  pairs = []
  all_pairs = []
  array.sort!
  
  pairs = array.combination(2).to_a
  all_pairs = pairs.select do |pair|
    pair[1] - pair[0] == 2
  end
  all_pairs
end

def twos_difference(array)
  array.sort.combination(2).select { |pair| pair[1] - pair[0] == 2 }
end

def twos_difference(array)
  array.sort.combination(2).select { |a, b| b - a == 2 }
end

p twos_difference([1, 2, 3, 4]) == [[1, 3], [2, 4]]
p twos_difference([1, 3, 4, 6]) == [[1, 3], [4, 6]]
p twos_difference([0, 3, 1, 4])  == [[1, 3]]
p twos_difference([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p twos_difference([6, 3, 4, 1, 5]) == [[1, 3], [3, 5], [4, 6]]
