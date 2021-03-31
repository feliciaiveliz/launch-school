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
- assign true to 'need_upper' variable
- assign to 'result' splitting the string into an array of chars and iterate over each
- if need_upper (is true)
- upcase! the char
- else if need_upper (is false)
- downcase! the char
- assign false to need_upper if char =~ /[a-z]/i
- this allows chars to alternate between cases in the if/else statement
- if the current char isn't a letter, it will repeat the current case state
- join the string
=end

def staggered_case(string)  
  need_upper = true
  result = string.chars.each do |char|
    if need_upper
      char.upcase!
    else
      char.downcase!
    end
    need_upper = false if char =~ /[a-z]/i
  end
  string.join
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'