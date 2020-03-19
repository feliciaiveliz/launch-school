# Write a method that will generate random English math
# problems. The method should take a length, then return
# a math phrase with that many operations.

=begin

PROBLEM: 
input: integer, # of operations
output: string
?: what should be done with input?
- with empty string: (1)
  - first => add number
  - second => add operation
  - third => add number
- 'n' => 'n' operations, 'n' numbers' (after first one is added)
ALGORITM:
- initialize 'english_problems' to []
- iterate 'n' times using #times
  - add first number to string using #<<
    - call #sample on string to get random number
  - add to string => sample 'operation', sample 'numbers'
- return string
=end

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(number)
  english_problems = []
  english_problems << NUMBERS.sample

  number.times do
    english_problems << OPERATORS.sample
    english_problems << NUMBERS.sample
  end
  english_problems.join(' ')
end

p mathphrase(1) # == "five minus two"
p mathphrase(2) #== "two plus three times eight"

# first try: 10 minutes 19 seconds