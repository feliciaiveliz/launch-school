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
Requirements: 
- 0, 4, 5, 6, 7, 8, 9, 10 - 
- years that end in 1 - st
- years that end in 2
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
- create century method that takes one parameter 'year'
- if year.end_with?()