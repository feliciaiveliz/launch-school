=begin

input: integer year
output: boolean
rules: 
- if year < 1752 && year % 4 == 0
  true
- if year >= 1752 && year % 400 == 0
  true
  if year >= 1752 && year % 100 == 0
  false
  if year >= 1752  && year % 4 == 0
  true
  else 
    false
=end




def leap_year?(year)
  if year < 1752 && year % 4 == 0 
    true
  elsif year >= 1752 && year % 400 == 0
    true
  elsif year >= 1752 && year % 100 == 0
    false
  else
    year >= 1752 && year % 4 == 0
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
