=begin
input: string or integer number
output: array of string commands
problem: 
- convert all input to integers
- convert the final number to its binary counterpart
algorithm:
- initialize 'result' to []
- convert number to binary using #<integer>.to_s(2)
- convert input to integer using #to_i
- convert number into an array and reverse so it's in order  
- return results
=end

COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']

class SecretHandshake
  def initialize(number)
    @number = number
    @result = []
  end

  def commands
    @number = @number.to_i.to_s(2).to_i.digits
    return [] if @number.include?('a-z')
    index = 0
    
    COMMANDS.each do |command|
      @result << command if @number[index] == 1
      index += 1
    end
    @number.size == 5 && @number[-1] == 1 ? @result.reverse : @result
  end
end

