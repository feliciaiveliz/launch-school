=begin
The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. 
Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years 
occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine 
leap years both before and after 1752.

input: integer
output: boolean
rules: 
- years prior to 1752 are leap if evenly div. by 4
- after 1752, year is leap if evenly div. by 4
- not div. by 100, but leap if div. by 400
examples: 
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true
data structure: if/elsif/else statement
algorithm: 
- create leap_year? method with 'year' param
- if year <= 1752 && year % 4 == 0 then true
- elsif year > 1752 && year % 4 == 0 && year % 100 != 0 then true
- elsif year % 400 == 0 then true
- else false
- end if/else
- end method
=end

# First Attempt (worked)
def leap_year?(year)
  if year <= 1752 && year % 4 == 0 
    true
  elsif year > 1752 && year % 4 == 0 && year % 100 != 0 
    true 
  elsif year > 1752 && year % 400 == 0
    true
  else
    false
  end
end

# Second Attempt (cleaned up, also worked)
def leap_year?(year)
  if year <= 1752 && year % 4 == 0 
    true
  elsif year % 4 == 0 && year % 100 != 0 
    true 
  elsif year % 400 == 0
    true
  else
    false
  end
end

p leap_year?(2016)
p leap_year?(2015) 
p leap_year?(2100) 
p leap_year?(2400) 
p leap_year?(240000)
p leap_year?(240001) 
p leap_year?(2000) 
p leap_year?(1900) 
p leap_year?(1752)
p leap_year?(1700)
p leap_year?(1) 
p leap_year?(100)
p leap_year?(400) 