=begin

Write a method that takes a year as input and returns the century. The return 
value should be a string that begins with the century number, and ends with st, 
nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise 
the 20th century.

Input: integer 
Output: string
Rules: 
- integer is year from 1 to 5 digits
- string starts with century number and ends with:
  - st, nd, rd, or th
- new centuries begin in years that end with 01
- 1901-2000 is the 20th century
Examples: 
- century(2000) == '20th'
- century(2001) == '21st'
- century(1965) == '20th'
- century(256) == '3rd'
- century(5) == '1st'
- century(10103) == '102nd'
- century(1052) == '11th'
- century(1127) == '12th'
- century(11201) == '113th'
- 0 to 100 is 1st 
- 101 - 200 is 2nd
- 201 - 300 is 3rd
- 301 - 400 is 4th
Algorithm:
- create century method that takes one parameter - year
- assign the year to 'century' variable
  - divide the year by 100 and add 1 to it
  - if the year % 100 == 0, then subtract by 1 and assign it back to century
- convert century to string- suffix will be appended to it
- create method 'century_suffix' that takes param- century
- return 'th' if 11, 12 or 13 is included in- cnetury % 100
- start case statement
  - last_digit = century % 10
  - case last_digit
  - when 1 then 'st'
  - when 2 then 'nd'
  - when 3 then 'rd'
  else 'th'
  - end case
- end method
=end

# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + suffix(century)
end


def suffix(century)
  return "th" if [11, 12, 13].include?(century % 100)
  century = century.to_s
  
  return "st" if century[-1] == "1"
  return "nd" if century[-1] == "2"
  return "rd" if century[-1] == "3" 
  "th"
end

p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10103)
p century(1052)
p century(1127)
p century(11201)

## STUDY THIS ONE
