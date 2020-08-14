=begin

In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

input: integer year
output: boolean
rules: 
- if the year is divisible by 4 it is leap year
- if also divisible by 100, not leap year
- if divisble by 100 and 400, then leap year 
pseudo-code:
- check least common rules first
- if year % 400 == 0 && year % 100 == 0
  true
- if year % 4 == 0 && year % 100 != 0
  true
- false
=end

def leap_year?(year)
  if year % 400 == 0 
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 400 == 0 && year % 100 == 0 && year % 4 == 0
    true
  else
    false
  end
end







p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true