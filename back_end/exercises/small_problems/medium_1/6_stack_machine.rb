=begin

input: string
output: integer
rules
- 'n': Place value 'n' in the 'register'. Do not modify stack
- PUSH Push the register value on to the stack. Leave the value in the register.
-ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
- SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
- MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
- DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
- MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
- POP Remove the topmost item from the stack and place in register
- PRINT Print the register value
- All operations are integer operations 
algorithm: 
- define minilang method
- initialize local variable 'register' to 0
- initialize hash called stack_terms 
# def minilang(string)
#   register = 0
#   stack = []

#   program.split.each { |command| }
#   case command
#   when 'PUSH' => stack.push(register)
#   when 'ADD' then register += stack.pop
#   when 'SUB' then register -= stack.pop 
#   when 'MULT' then register *= stack.pop
#   when 'DIV' then register /= stack.pop
# etc.
=end

def minilang(program)
  register = 0
  stack = []

  program.split.each do |command|
    case command
    when 'PUSH' then stack << register
    when 'ADD'  then register += stack.pop
    when 'SUB'  then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV'  then register /= stack.pop
    when 'MOD'  then register %= stack.pop
    when 'POP'  then register = stack.pop
    when 'PRINT' then puts register
    else register = command.to_i
    end
  end
end

minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')

# this problem was fun