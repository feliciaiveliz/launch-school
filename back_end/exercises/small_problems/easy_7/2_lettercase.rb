=begin

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

input: string
output: hash
rules: 
- hash will have three entries: 
  - lowercase counter, uppercase counter, neither counter
  - key will be symbol, value will be integer
- string can have 0 or more words
- string can have letters of both cases, numbers, or neither
- if string empty, return hash entries of 0 for all three keys
- numbers, spaces and special characters are considered 'neither'
data structure: string, array, hash
algorithm: 
- define letter_case_counter(string) method
- if string.empty? return {:lowercase => 0, :uppercase => 0, :neither => 0}
- create empty hash with starting value of 0 
  - lettercase = Hash.new(0)
- split string into array of characters, save to variable chars and iterate using 'each'
  - chars = string.chars.each {|char|}
- assign to :lowercase = 0, :uppercase = 0, neither = 0
- if char =~ /[a-z]/ then lettercase[:lowercase] += 1
- if char =~ /[A-Z]/ then lettercase[:uppercase] += 1
- else then lettercase[:neither] += 1
- return lettercase hash
- end method
=end 

def letter_case_count(string)
  lettercase = {lowercase: 0, uppercase: 0, neither: 0}
  
  string.chars.each do |char|
    if char =~ /[a-z]/ then lettercase[:lowercase] += 1
    elsif char =~ /[A-Z]/ then lettercase[:uppercase] += 1
    else lettercase[:neither] += 1
    end
  end
  lettercase
end

p letter_case_count('abCdef 123')
p letter_case_count('AbCd +Ef')
p letter_case_count('123')
p letter_case_count('')

