=begin

Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

input: string, integer
output: string printed 'integer' times
rules: 
- the string must be printed as many times as the integer states
- number will be positive
examples: 
repeat('Hello', 3) => Hello Hello Hello
pseudo-code: 
- create a method called repeat that takes two parameters
  - string and number
- print the string 'number' amount of times within method
algorithm: 
- define repeat(string, number)
- invoke #times method on number 
- within block, output the value of the string using #puts
- end method
=end

def repeat(string, number)
  number.times { puts string }
end

# or 

def repeat(string, number)
  count = 0
  until count >= number
    puts string
    count += 1
  end
end

# or 

def repeat(string, number)
  count = 0
  loop do 
    break if count == number
    puts string
    count += 1
  end
end


repeat('Hello', 3)