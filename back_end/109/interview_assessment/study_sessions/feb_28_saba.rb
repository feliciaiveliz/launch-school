def absent_vowel(string)
  vowels = %w(a e i o u)
  vowels.find_index {|v| !string.include?(v) }
end