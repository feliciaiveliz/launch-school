=begin

Write a method that returns the number of Friday the 13ths in the year
passed in as an argument. You may assume that the year is greater than
1752 (when the modern Gregorian Calendar was adopted by the United
Kingdom), and you may assume that the same calender will remain in use
for the foreseeable future.


Hint: Ruby's `Date` class could be helpful here.
 - look at how to initialize a Date object
 - look at the `friday?` method 

PROBLEM - 
input: integer, year
output: integer, # of Friday 13ths in input year
?: what sould be done with the input?
- find all 13ths of every month in a year
- count # of friday in list of 13ths
ALGORITM -
- create a range from 1 to 12 (represents months)
- iterate using #select, pass 'month' to block:
  - use 'month', 13, year to create date 
  - use #friday? to select all fridays
- count fridays
=end

require 'Date'

def friday_13th(year)
  (1..12).select { |month| Date.new(year, month, 13).friday? }.count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
