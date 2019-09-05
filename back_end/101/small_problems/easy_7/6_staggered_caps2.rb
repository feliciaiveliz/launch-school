=begin

Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

input: string
output: new string
rules: 
- ignore all non-letter characters
- all non-letter chars should be included in return value
- only count the letters
examples: 
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
data structure: array, string
algorithm: 
- define staggered_case(string) method
- initialize to empty variable 'caps' and empty array- caps = []
- split string into array of individual characters- string.chars
- iterate over array and delete all spaces so only letters are left 
- string.chars.map {|char|}
  - char.gsub!(/[^a-z]/i, '')
- end map method
  def staggered_case(string)
  caps = []
  string.chars.each_with_index do |char, index|
    if index.even?
      caps << char.upcase
    elsif index.odd?
      caps << char.downcase
    else
      char
    end
  end
  caps.join
end
=end

def staggered_case(string)
  string.delete('^a-zA-Z0-9')
  
  caps = []
  string.chars.each_with_index do |char, index|
    if index.even?
      caps << char.upcase
    elsif index.odd?
      caps << char.downcase
    else
      char
    end
  end
  caps.join('')
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'