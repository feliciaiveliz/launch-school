# https://www.codewars.com/kata/5340298112fa30e786000688

=begin

The objective is to return all pairs of integers from a given array of integers that have a difference of 2.
The result array should be sorted in ascending order of values.
Assume there are no duplicate integers in the array.
The order of the integers in the input array should not matter.

Understand the Problem
The problem description explicitly states a number of the problem requirements.
It also defines some of the parameters of the problem, e.g. no duplicates in the input array
It also provides some clues as to how to approach the problem, e.g. the fact that the order of the input array is irrelevant, but that the output should be ordered.
There's a few things that the description doesn't really outline explicitly, e.g.
How should the output be structured?
When it says 'The result array should be sorted in ascending order of values', does this just mean the outer array, or the values in the sub-array as well?
Does the input array include negative integers?
These types of questions can be answered by examining the test cases, but it is good to already be thinking about them at the Problem stage of the process
One of the keys to this problem is identifying and extracting the various separate elements to the problem, and working out a solution for each element.
Individually, each element is not that complex, but when first approaching the problem the problem as a whole may appear complex because it hasn't been broken down yet.
The process of extracting the different elements of the will mostly take place during the Algorithm step, but it's important that that step be informed by the understanding of the problem formed at this step.

Examples and Test Cases

Examining the test cases should confirm a number of things from the problem description as well as answering various questions raised during the Problem stage and providing some implicit requirements:
- The input array only contains integers
- The input array always contains at least two integers
- The output array contains nested arrays containing the pairs of integers that have a difference of two
- If there are no matching pairs the output array should be empty
- If there is only one matching pair, the output should still contain that pair as a sub-array
- The order of the integers in input array has no impact on the order of the integers and pairs in the output array
- The integers in the sub-arrays of the output array are ordered numerically in ascending order
- The sub-arrays themselves are in ascending numerical order
- These last three points should suggest that it doesn't matter which

Data Structures

There's nothing overly complex in the input and output data
- Input is an unsorted array or integers
- Output is a sorted nested array of integer pairs that have a difference of two.
- There's a question around whether the data needs to be temporarily represented in some way while being processed, though this depends in large part on the algorithm.

Algorithm

The different steps to think about are:
Producing 'pairs' of integers from the input array
Selecting/ eliminating pairs that do/don't meet the criteria
This criteria is that there is a difference of two, so a subtraction operation is a logical approach, but a consideration is which integer is subtracted from which, and whether the result might be a negative -2 which still represents a difference of two
Sort the sub-array
Sorting the result array

p difference_of_two([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
p difference_of_two([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p difference_of_two([1, 23, 3, 4, 7]) == [[1, 3]]
p difference_of_two([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]
p difference_of_two([2, 4]) == [[2, 4]]
p difference_of_two([1, 4, 7, 10, 13]) == []
=end

def difference_of_two(arr)
  pairs = []
  arr.each_with_index do |num, outer_idx|
    (outer_idx..(arr.length - 1)).each do |inner_idx|
      if (num - arr[inner_idx]).abs == 2
        pairs << [num, arr[inner_idx]].sort
      end
    end
  end
  pairs.sort
end

def difference_of_two(arr)
  arr.sort!
  pairs = []
  arr.each_with_index do |num, outer_idx|
    (outer_idx..(arr.length - 1)).each do |inner_idx|
      if arr[inner_idx] - num == 2
        pairs << [num, arr[inner_idx]]
      end
    end
  end
  pairs
end

def difference_of_two(arr)
  arr.combination(2).select { |sub_arr| (sub_arr[0] - sub_arr[1]).abs == 2 }.map(&:sort).sort
end

def difference_of_two(arr)
  arr.sort.combination(2).select { |sub_arr| sub_arr[1] - sub_arr[0] == 2 }
end

p difference_of_two([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
p difference_of_two([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p difference_of_two([1, 23, 3, 4, 7]) == [[1, 3]]
p difference_of_two([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]
p difference_of_two([2, 4]) == [[2, 4]]
p difference_of_two([1, 4, 7, 10, 13]) == []