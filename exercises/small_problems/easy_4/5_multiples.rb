=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, 
and then computes the sum of those multiples. For instance, if the supplied number is 20, the result 
should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

inputs: 
- integer
- multiples of 3 or 5
outputs:
- sum of multiples
rules: 
- multiples of 3: 3, 6, 9, 12, 15, 18
- multiples of 5: 5, 10, 15, 20
- multiple means a number that can be divided by another number without a remainder
- unique numbers only, since 15 is divisible by 3 & 5, it only add it once
- target number is included in sum
- integers are greater than 0
- if 3 is given, return 3, if 5 is given then return both multiples of 3 and 5
- examples: 
multisum(0) == 0
multisum(3) == 3 
multisum(5) == 8 => 3 + 5 
multisum(10) == 33 => 3 + 5 + 6 + 9 + 10
multisum(1000) == 234168
- data structure: an array
algorithm: 
- create empty array to contain- multiples 
- create multisum array w/ 2 params- number, factors
- if number equal to 0, then return 0
- set list of factors equal to [3, 5]
- set factors to current_multiple- current_multiple = 3 
- while the current_multiple is less than or equal to target
- add current_multiple to multiples array
- add that factor to multiples array, move on to next factor
- filter list of multiples to get rid of duplicates, save only unique numbers
- compute sum and return list of numbers in multiples array
=end

# def multisum(target) 
#   multiples = []
#   factors = [3, 5]
#   return 0 if target == 0
  
#   factors.each do |factor|
#     current_multiple = factor # (3)

#     while current_multiple <= target # while 3 (or current mult of 3) is less than 10
#       multiples << current_multiple # [3]
#       current_multiple += factor # 3 = 3 + 3 => 6
#     end
#   end # when current_multiple > 10, then go back to factors method, and set current mult to 5.

#   multiples.uniq.sum
# end

# Further Exploration
def multisum(number)
  (1..number).select { |i| i % 3 == 0 || i % 5 == 0 }.sum
end


p multisum(0)
p multisum(3)
p multisum(5)
p multisum(10) 
p multisum(1000)



