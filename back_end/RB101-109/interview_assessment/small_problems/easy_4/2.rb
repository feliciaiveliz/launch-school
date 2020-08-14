=begin

Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

input: integer year
output: string
rules: 
- new centuries start at 01
  2001 - 21st century
- 1 - st
- 2 - nd 
- 3 - rd
- 4 - 10 - th
- 11 - th
- 12 - th
- 13 - th
- if year ends in 0, it belongs to century
  the number starts with - 2000 = 20th
data structure: strings, integers
pseudo-code: 
- figure out what century the years belong to
- take care of years that end in 0
- convert everything to strings
- append the appropriate suffix to the century
- return the century string
algorithm: 
- create a variable called 'century' and assign it to 
  - year / 100 + 1 to get the century the year belongs to
- if the year mod 10 ends in 0, minus 1 to 'century'
- assign century to century converted to a string
- case statement
- if the century number includes '11', '12', '13'
  - append 'th'
- when the century ends in '1' then 'st'
- when it ends in '2' then 'nd'
- when it ends in '3' then 'rd'
- 'th'
- return century number
=end
require 'pry'

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + suffix_generator(century)
end

def suffix_generator(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10 

  case last_digit 
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) # 113rd
    


