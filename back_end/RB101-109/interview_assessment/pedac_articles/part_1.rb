# Suppose you have an arbitrary natural number (the target) and a set of one or more additional natural numbers (the factors). Write a program that computes the sum of all numbers from 1 up to the target number that are also multiples of one of the factors. 
# For instance, if the target is 20, and the factors are 3 and 5, that gives us the list of multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78.
# If no factors are given, use 3 and 5 as the default factors.

=begin

inputs: 
- target number
- the set of factors

outputs: 
- sum of multiples

example:
- target number: 20
- factors: 3 and 5
- multiples of 3: 3, 6, 9, 12, 15, 18
- multiples of 5: 5, 10, 15

Rules: 
- the multiples to be summed must be unique
  - 15 is a multiple of 3 and 5 but only appears once 
- the target number is not included in set of multiples
- all numbers are natural numbers
  - set of integers greater than or qeual to 0 or 1

Questions: 
- What are the possible values for the target number? 
- Are negative numbers allowed?
  - Any natural number greater than 0. There will always be a target number
- How will the factors be provided to the program? 
  - As an array
- What happens if only 3 or 5 is provided as a factor? Should the program still
default to both 3 and 5 as factors? 
  - No. Default to 3 and 5 only if no factors are provided. 

Mental Model: 
Determine a list of all multiples of a set of factors up to a target value, then filter the list
of multiples to the unique values. Finally, compute and return the sum of the unique multiples. 

Incrementally build a list of numbers that are multiples of a set of one or more factors. 
Add a multiple to the list only if it is not yet on the list. Finally, compute and return the 
sum of the numbers on the list. 

Examples: 
inputs: 
- target number: 20
- factors: [3, 5]
output: 
- 78

inputs: 
- target number: 20
- factors: [3]
output: 
- 63

inputs: 
- target number: 20
- factors: [5]
outputs: 
- 30

inputs: 
- target number: 20
- factors: []
outputs: 78

inputs: 
- target number: 1
- factors: []
outputs: 0

Data Structure: 
- array

Algorithm: 
- create an empty array called multiples that will contain the factors
- check whether the list of factors is empty. If there are no factors, set the list
  to [3, 5]
- for every factor in the factors list: 
  - set the current_multiple to factor to keep track of the multiples of 'factor'
  - while the current_multiple < target
    - append the current_multiple to multiples
    - add factor to current_multiple
- filter duplicate numbers from multiples
- compute and return the sum of the numbers in multiples

Algorithm: 
- Create an empty array called 'multiples' that will contain the list of multiples
- check whether the list of factors is empty. If empty, set the list to [3, 5]
- for every factor in the 'factors' list: 
  - set the current_multiple to 'factor' to keep track of the multiples of factor
  - while current_multiple < target
    - is the current_multiple in multiples already?
      - yes - do nothing
      - no - append the current_multiple to multiples
- compute and return the sum of the numbers in multiples

Implement the Algorithm w/ first Example: 

inputs: 
- target number: 20
- number to get multiples (factors): [3, 5]
output: 
- 78

Algorithm: 
- Create an empty array called 'multiples' that will contain the list of multiples
  multiples = []
- Check whether the list of factors is empty. If empty, set list to [3, 5]
  [3, 5] obtained from supplied factors
- For every 'factor' in the factors list: [3, 5]
  - Set the 'current_multiple' to 'factor' to keep track of the multiples of 'factor'
    current_multiple = 3
    current_multiple = 5
  - while 'current_multiple' < target
    1. Append the 'current_multiple' to 'multiples'
    multiples = [3]
    multiples = [3, 6]
    multiples = [3, 6, 9]
    ...
    multiples = [3, 6, 9, 12, 15, 18, 5, 10, 15]
    2. Add 'factor' to 'current_multiple'
    current_multiple = 6
    current_multiple = 9
    current_multiple = 18
    ...
    current_multiple = 21
    current_multiple = 5
    current_multiple = 10
    current_multiple = 15
    current_multiple = 20
- Filter duplicate numbers from 'multiples'
  multiples = [3, 6, 9, 12, 15, 18, 5, 10]
- Compute and return the sum of the numbers in 'multiples'
  - 78

Code: 
=end

def sum_of_multiples(target, factors)
  multiples = []
  factors = [3, 5] if factors.empty?

  factors.each do |factor|
    current_multiple = factor
    
    while current_multiple < target
      multiples << current_multiple
      current_multiple += factor
    end
  end
  multiples.uniq.sum
end


p sum_of_multiples(20, [3, 5])  # returns 78
p sum_of_multiples(20, [3])     # returns 63
p sum_of_multiples(20, [5])     # returns 30
p sum_of_multiples(20, [])      # returns 78
p sum_of_multiples(1, [])       # returns 0
p sum_of_multiples(20, [19]) 
  