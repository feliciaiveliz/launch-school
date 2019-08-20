=begin

input: string of digits
output: integer
rules: 
- the string might lead w/ either +, -, or neither
- if first character is +, return positive number
- if second character is -, return negative number
- if no sign, return positive
- cannot use standard conversion methods, but we may use string_to_integer method
- plus sign is not included in final integer
data structure: array, hash, if/else statement
algorithm: 
- if string includes?('-')
  value.prepend('-')
- else return value
- rest of method
=end
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}


def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_signed_integer(string[1..-1])
  when '+' then string_to_signed_integer(string[1..-1])
  else string_to_signed_integer(string)
  end
end

def string_to_signed_integer(string)
  if string.start_with?('-')
    string.delete!('-')
    -string_to_integer(string)
  else
    string_to_integer(string)
  end
end



p string_to_signed_integer('4321')
p string_to_signed_integer('-570')
p string_to_signed_integer('100')
