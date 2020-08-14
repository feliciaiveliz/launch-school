=begin

input: integer target number
output: integer sum
rules: 
- int is greater than 0
- a multiple is a number that can be divided evenly by another
- the target number is included in sum
- if the target number is a factor that can only be divisible by 1 and itself, return the factor
  - if 3, return 3. if 5, return 5.
data strucure: integers
pseudo-code: 
- from 1 up to the target number
- add the factor value to the sum variable 
  if the number is evenly divisible by 3 or 5
- iterate until it reaches the target number
- once iteration is done, return the multiple variable which should
  contain the sum of all the multiples from 1 up to the target number
algorithm: 
- initialize variable 'multiple' to 0
- iterate over factors using #each
- from 1 .. target number, multiple += factor(3) % == 0 || factor(5) == 0
- multiple should contain sum of all numbers from 1 to the target number
- return sum
=end

def multisum(number)
  sum = 0
  (1..number).each do |num|
    sum += num if num % 3 == 0 || num % 5 == 0
  end
  sum
end




p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168