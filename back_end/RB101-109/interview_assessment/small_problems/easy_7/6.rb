=begin

Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

input: string
output: a new string
rules: 
- ignore non-letter chars
- include non-letter chars in r.v, but they don't count when determining case
data structure: array, string
pseudo-code: 
- create an empty array
- split string into an array of individual chars
- iterate over chars
- if char is a letter, upcase it
- if char is a non-letter, downcase
algorithm: 
- split string into an array of chars
- iterate using #map
- init. variable lower = ('a'..'z').to_a
- init. variable upper = ('A'..'Z').to_a
- init. variable uppercase = true
- if (&&) LOWER includes char and UPPER includes char
  - if uppercase = true
    - char.upcase
  - if uppercase = false
    - char.downcase
- elsif char is not a letter
    - char
- uppercase = !uppercase
=end

LOWER = ('a'..'z').to_a
UPPER = ('A'..'Z').to_a

def staggered_case(string)
  a = []
  uppercase = true
  string.chars.each do |char|
    if LOWER.include?(char) || UPPER.include?(char)
      if uppercase
        a << char.upcase
      else
        a << char.downcase
      end
    else
      a << char
      uppercase = !uppercase
    end
    uppercase = !uppercase
  end
  a.join
end

p staggered_case('I Love Launch School!')
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'