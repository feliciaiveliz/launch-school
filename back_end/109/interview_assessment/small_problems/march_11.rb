Easy 1

def reverse_sentence(string)
  string.split.reverse.join(" ")
end

puts reverse_sentence('') == ''
p reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

def reverse_words(string)
  string.split.map { |word| word.size >= 5 ? word.reverse! : word }.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

def stringy(digit)
  str = ""

  digit.times { |n| n.even? ? str << "1" : str << "0" }

  str
end

def stringy(digit, start = 1)
  str = ""

  if start == 0
    digit.times { |n| n.even? ? str << "0" : str << "1" }
  else
    digit.times { |n| n.even? ? str << "1" : str << "0" }
  end
  str
end


puts stringy(6, 0) #== '101010' '010101'
puts stringy(9, 1) #== '101010101'
puts stringy(4, 0) #== '1010' '0101'
puts stringy(7, 1) #== '1010101'

def average(array)
  (array.sum / array.size).to_f
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

def sum(number)
  number.digits.sum
end

def sum(number)
  number.to_s.chars.map(&:to_i).sum
end

def sum(number)
  sum = 0
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

def calculate_bonus(salary, boolean)
  boolean ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

Easy 2

puts "What is your name?"
name = gets.chomp.capitalize

if name.empty? 
  puts "Teddy is #{rand(20..200)} years old!"
else
  puts "#{name}, you are #{rand(2..200)} years old!"
end

puts "What is your name?"
name = gets.chomp

if name[-1] == "!" 
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}." 
end

(1..99).each { |n| puts n if n.odd? }

value = 1
while value <= 99
  puts value
  value += 2
end

(1..99).each { |n| puts n if n.even? }

(1..99).select { |n| n.even? }

puts "Enter the first number: "
first = gets.chomp.to_i

puts "Enter the second number: "
second = gets.chomp.to_i

sum = first + second
difference = first - second
product = first * second
quotient = first / second
remainder = first % second
power = first ** second

puts "#{first} + #{second} = #{sum}"
puts "#{first} - #{second} = #{difference}"
puts "#{first} * #{second} = #{product}"
puts "#{first} / #{second} = #{quotient}"
puts "#{first} % #{second} = #{remainder}"
puts "#{first} ** #{second} = #{power}"

puts "Please write a word or multiple words: "
string = gets.chomp
string = string.delete(" ")
puts "There are #{string.size} characters in #{string}."

def multiply(a, b)
  a * b
end

p multiply(5, 3)

def square(n)
  multiply(n, n)
end

p square(5)
p square(-8)

def oddities(list)
  list.select.with_index { |item, idx| item if idx.even? }
end

def oddities(list)
  list.select.with_index { |item, idx| item if idx.odd? }
end


def oddities(list)
  odd_elements = []
  index = 0

  while index < list.size
    odd_elements << list[index]
    index += 2
  end

  odd_elements
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

def real_palindrome?(string)
  string = string.downcase.delete('^0-9a-z')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') #== true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

def short_long_short(a, b)
  if a.size > b.size
    b + a + b
  else
    a + b + a
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"