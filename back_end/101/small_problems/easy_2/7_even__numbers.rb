=begin

Output: 
- even numbers from 1 to 99

Rules: 
- print each number on own line
- number must be even
- range is from 1 to 99 inclusive

Algorithm:
- select numbers from range
  - (1..99).select
- perform even number selection
  - { |i| p i if i.even? }
=end

(1..99).select { |i| p i if i.even? }