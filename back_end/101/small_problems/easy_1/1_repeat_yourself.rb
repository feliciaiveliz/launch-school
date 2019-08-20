# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# repeat('Hello', 3)

=begin

*Inputs: 
- two arguments 
 - string
 - integer
   - integer must be positive

*Outputs: 
- same string
- each string on its own line

*Rules:
- the number of times the string is printed depends on the number
- validate that the number is greater than 0

*Examples/Test Cases:
- repeat('Hello', 3) => 'Hello'
                        'Hello'
                        'Hello'

*Data Structure:
- loop construct
- times method on integer


Algorithm: 
- create method called 'repeat'
- loop
  - use counter to start at 0
  - until the count is equal to the number specified
  - print string
  - increment counter
- end method
=end


def repeat(string, number)
    count = 0
    until count >= number
      puts string
      count += 1
    end
end
  
  repeat("Howdy Partner", 7)
  
  def repeat(string, num)
    num.times { puts string }
  end
  
  repeat("Hey", 3)