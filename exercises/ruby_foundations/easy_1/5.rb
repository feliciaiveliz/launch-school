# # Encrypted Pioneers

# =begin
# output: string name deciphered
# - replace each letter (upper and lowercase) with the 13th letter following it
# algo:
# - create upperletters array
# - create lowerletters array
# - create empty string
# - split string into words
#   - split word into letters
#   - if letter is uppercase letter 
#     - use uppercase alphabet
#     - find index of current letter, add 13 to it
#     - take that total and mod 26, result is the index of needed letter
#   - add that letter to new string
#   - repeat if lowercase
#   - else add character (space or dash) to string
# - return string
# =end

UPPER = ("A".."Z").to_a
LOWER = ('a'..'z').to_a

def decipher(name)
  result = ""

  name.each_char do |char|
    if UPPER.include?(char)
      index = ((UPPER.index(char) + 13) % 26)
      result << UPPER.at(index)
    elsif LOWER.include?(char)
      index = ((LOWER.index(char) + 13) % 26)
      result << LOWER.at(index)
    else
      result << char
    end
  end
  result
end

p decipher("Nqn Ybirynpr")
p decipher("Tenpr Ubccre")
p decipher("Nqryr Tbyqfgvar")
p decipher("Nyna Ghevat")
p decipher("Puneyrf Onoontr")
p decipher("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p decipher("Wbua Ngnanfbss")
p decipher("Ybvf Unvog")
p decipher("Pynhqr Funaaba")
p decipher("Fgrir Wbof")
p decipher("Ovyy Tngrf")
p decipher("Gvz Orearef-Yrr")
p decipher("Fgrir Jbmavnx")
p decipher("Xbaenq Mhfr")
p decipher("Fve Nagbal Ubner")
p decipher("Zneiva Zvafxl")
p decipher("Lhxvuveb Zngfhzbgb")
p decipher("Unllvz Fybavzfxv")
p decipher("Tregehqr Oynapu")

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else
    encrypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
