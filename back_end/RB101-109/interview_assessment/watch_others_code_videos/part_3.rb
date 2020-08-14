=begin

input: string, operation
output: integer, result of calculation
data structure: 
- array
- hash, key: english word, value: integer
algorithm: 
- create a hash that maps english words to their numbers
- create an array of operations: +, -
- create a variable called first
- create a variable called second
- split the string into an array of words
- iterate over the words
- save the first word in string to 'first', use the key to save the integer
  - first = WORDS[word]
- save the second word into a variable called 'operation'
- save the third word into the 'second' variable
- once iteration is done, perform the calculation
- return result
=end

require 'pry'

WORDS = { "zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, 
          "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9, "ten" => 10 }

# def computer(string)
#   string = string.split
#   first = WORDS[string[0]]
#   second = WORDS[string[-1]]
#   operation = string[1]
#   result = 0

#   # operation == "plus" ? first + second : first - second
 
#   case operation
#   when "plus" then first + second
#   when "minus" then first - second
#   end
# end


def computer(string)
  array = []
  string = string.split
  string.delete("by")

  string.each do |word|
    if WORDS[word].to_s.to_i == WORDS[word]
      array << WORDS[word]
    else
      array << word
    end
  end
  
  loop do 
    break if !array.include?("plus") && 
    !array.include?("minus") &&
    !array.include?("times") && 
    !array.include?("divided")
    
    first_three = array.take(3)

    first = first_three[0]
    second = first_three[-1]
    operation = first_three[1]
    result = 0

    case operation
    when "plus" then result = first + second
    when "minus" then result = first - second
    when "times" then result = first * second
    when "divided" then result = first / second
    end
    
    array.shift(3)
    array.unshift(result)
  end
  array.first
end


p computer("two plus two") # 4
p computer("seven minus six") # 1
p computer("zero plus eight") # 8
p computer("three minus one plus five minus four plus six plus ten minus four") # 15
p computer("eight times four plus six divided by two minus two") # 17
p computer("one plus four times two minus two") # 8
p computer("nine divided by three times six") # 18


