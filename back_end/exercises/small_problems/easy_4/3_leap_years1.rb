=begin

In the modern era under the Gregorian Calendar, leap years occur in every year 
that is evenly divisible by 4, unless the year is also divisible by 100. If the year is 
evenly divisible by 100, then it is not a leap year unless the year is evenly divisible 
by 400.

Assume this rule is good for any year greater than year 0. Write a method that 
takes any year greater than 0 as input, and returns true if the year is a leap year, or 
false if it is not a leap year.

Input: integer
Output: boolean
Rules: 
- integer is a year > than 0
- leap years occur every year that is evenly divisible by 4
- not leap year if also divisible by 100
- if the year is divisible by 100, it is leap year if year divisible by 400
Examples: 
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
Data Structure: 
- integer, modulo, if/elsif/else statement
Algorithm: 
- create leap_year? method that takes one argument 'year'
- if year % 4 == 0 && year % 100 != 0
  - true
- elsif year % 400 == 0
  - true
- else
  - false
- end if/elsif/else
- end method
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

or

def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
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


# Further Exploration
def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 400 == 0
    true
  else
    false
  end
end

leap_year?(2016) == true     # true
leap_year?(2015) == false    # false
leap_year?(2100) == false    # false
leap_year?(2400) == true     # false ** Will fail b/c it is divisible by 400 but it doesn't reach that check b/c it is also divisible by 100
leap_year?(240000) == true   # false ** Same as above; will fail b/c it doesn't reach 400 check
leap_year?(240001) == false  # false 
leap_year?(2000) == true     # false ** Same as above
leap_year?(1900) == false    # false
leap_year?(1752) == true     # true
leap_year?(1700) == false    # false
leap_year?(1) == false       # false
leap_year?(100) == false     # false
leap_year?(400) == true      # false ** Same as above
