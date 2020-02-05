# Write a method that takes a signle String argument and returns a new string that contains the original value
# of the argumetn, but the first letter of every word is now capitalized.

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

puts word_cap("four score and seven")
puts word_cap("the javascript language")
puts word_cap('this is a "quoted" word')

# Write a method that returns the number of friday the 13ths in the year passed in as an argument. 

require 'Date'

def friday_13ths(year)
  fridays = 0

  (1..12).each do |month|
    fridays += 1 if Date.new(year, month, 13).wday == 5
  end

  fridays
end

p friday_13ths(2015) # 3
p friday_13ths(1986) # 1

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(number_of_operations)
  operations = [NUMBERS.sample]

  number_of_operations.times do |number|
    operations << OPERATORS.sample
    operations << NUMBERS.sample
  end
  operations.join(' ').gsub("divided", "divided by")
end

p mathphrase(1)
p mathphrase(2)
p mathphrase(3)
