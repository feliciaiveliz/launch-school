=begin
input: string - letter or multiple letters, with or without spaces in between
output: string - letter or multiple letters after rotation
problem:
- replace letter with another letter 13 postitions away
- consider lowercase and uppercase letters
- move backwards in alphabet for 14th-26th letters:
- when you add 13 to 'm' index it equals 25 which is 'z'
- once index of desired letter is found, return the letter
- preserve spaces and punctuation
algorithm:
- define 'cipher' class method
  - initialize 'LOWER' alphabet to 'a'..'z'
  - initialize 'UPPER' alphabet to 'A'..'Z'
  - initialize result to []
  - split 'string' into array and iterate using 'each_char', given 'char'
    - if letter is included in LOWER:
      - assign to 'index' a.index('char') + 'number' % 26
      - use #[] to retrieve the letter
        - << 'result'
    - if letter is included in UPPER:
      - repeat previous steps
    - else
      - << char to results
    - end
- return results.join
=end

UPPER = ('A'..'Z').to_a
LOWER = ('a'..'z').to_a

class Cipher
  def self.rotate(string, n)
    string.chars.each_with_object([]) do |l, result|
      if LOWER.include?(l)
        index = (LOWER.index(l) + n) % 26
        result << LOWER[index]
      elsif UPPER.include?(l)
        index = (UPPER.index(l) + n) % 26
        result << UPPER[index]
      else result << l
      end
    end.join
  end
end
