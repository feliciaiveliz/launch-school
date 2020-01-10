=begin

# take a string as an argument, return the string in reverse order.

input: string
output: new string
rules: 
- new string will contain original value of string, but reversed
- cannot use #reverse
data structure: array, string
pseudo-code: 
- create an empty array that will hold new string values
- split string into an array of characters
- iterate backwards over this array of characters
- for each character, we will append it to the reversed_string array
- end iteration
- return reversed_string array and convert it back to a string
algorithm: 
- define string_reverser method and pass in one parameter 'string' 
- invoke #chars on the string to split into chars. and iterate over array using #reverse_each
- for each char, append to reversed_string using #<< 
- end iteration
- return reversed_string, invoke #join to convert to string
=end

def string_reverser(string)
  reversed_string = []  
  string.chars.reverse_each do |char|
    reversed_string << char
  end
  reversed_string.join
end


puts string_reverser("hello world") 
puts string_reverser("I love my cat")
puts string_reverser("hello")

# ***

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers
# except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz"/
# input: fizzbuzz(1, 15)
# output: 
# 1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"

def fizzbuzz(start_num, end_num)
  numbers = (start_num..end_num).to_a
  words = []

  numbers.each do |num|
    if num % 3 == 0 && num % 5 == 0
      words << "FizzBuzz"
    elsif num % 3 == 0
      words << "Fizz"
    elsif num % 5 == 0
      words << "Buzz"
    else 
      words << num
    end
  end
  words.join(', ')
end

# puts fizzbuzz(1, 15)

# ********

PRODUCTS = [
  { name: "Thinkpad x210", price: 220 }, 
  { name: "Thinkpad x220", price: 250 }, 
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 }, 
  { name: "Thinkpad x230", price: 330 }, 
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Thinkpad x210", price: 220 }, 
  { name: "Macbook Leopard", price: 300 },
  { name: "Mackbook Air", price: 700 }, 
  { name: "Macbook Pro", price: 600 }, 
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 }, 
  { name: "Dell Latitude", price: 650 }, 
  { name: "Dell Inspiron", price: 300 }, 
  { name: "Dell Inspiron", price: 450 }, 
]

query = {
  price_min: 240, 
  price_max: 280, 
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  PRODUCTS.select do |element| 
    (query[:price_min]..query[:price_max]).include?(element[:price]) && 
    (element[:name]).downcase.include?(query[:q])
  end
end

p search(query)
# [ { name: "Thinkpad x220", price: 250 }]

p search(query2)
# [ { name: "Dell Inspiron", price: 300 }]
# [ { name: "Dell Inspiron", price: 450 }]


=begin

1. print out something
2. print out the PRODUCTS
3. iterate and print out each element in PRODUCTS
4. iterate and print out elements that are less than 350 in price
5. start to incorporate the query criteria, only max price
6. add in one more query criteria