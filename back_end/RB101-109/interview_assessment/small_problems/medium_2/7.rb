=begin

Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

input: integer, year
output: integer, friday the 13th counts
rules: 
- 12 13ths in a given year
- assume year is > 1752
- calendar days of week: 
  - 1-7, Monday is 1, Friday is 5
data structure: integer
algorithm:
- require 'date'
- use #wday for day of the week or friday?
- create an array of months
- create a hash of months from jan to dec
  - key: month, value: day of week as integer
- iterate through months
- pass in months to block
- given a year and a month, find the 13th day
- once hash is completed, count the number of 5's
- return that number
=end
require 'Date'

def friday_13th(year)
  hash = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 
  7 => 0, 8 => 0, 9 => 0, 10 => 0, 11 => 0, 12 => 0 }
  
  hash.each do |month|
    hash[month] = Date.new(year, month, 13).cwday
  end
  hash.values.count(5)
end

def friday_13th(year)
  hash = {}
  1.upto(12) do |month|
    hash[month] = Date.new(year, month, 13).cwday
  end
  hash.values.count(5)
end

def friday_13th(year)
  count = 0
  1.upto(12) { |month| count += 1 if Date.new(year, month, 13).friday? }
  count
end

p friday_13th(2015) 
p friday_13th(1986) 
p friday_13th(2019)
