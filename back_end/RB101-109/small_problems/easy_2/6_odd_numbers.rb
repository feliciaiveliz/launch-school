=begin

Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on seperate lines.

Output: 
- odd numbers
- each number on own line

Rules: 
- print numbers 1 to 99
- include 99 in range
- skip number if number % 2 == 0

Examples: 
- 1
- 3
- 5
...
- 99

Algorithm:
- contain range of numbers
  - (1..99)
- iterate through range and select odd numbers
  - (1..99).select do |num|
  - p num if num % 2 == 1
- end method
=end

(1..99).select do |num|
  p num if num % 2 == 1
end

(1..99).select { |i| p i if i.odd? }

