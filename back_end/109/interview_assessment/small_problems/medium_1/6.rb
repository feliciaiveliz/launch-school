=begin

A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.
A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.
Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.
Write a method that implements a miniature stack-and-register-based programming language that has the following commands:
All operations are integer operations (which is only important with DIV and MOD).
Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

input: string of integers and commands
output: integers, result of operations
rules: 
- register: current value (start at 0)
- register is not part of stack
- operations: pop top value from stack and perform operation using 
  it and the register value; store the result back in register
- 'n': place value in stack
- 'PUSH': push register value on to stack. Leave value in register
- 'ADD': pop value from stack and add it to register; store result in register
- 'SUB': pop value from stack and substract it from register value; store
  result in register
- 'MULT': pop value from stack and multiply it by register value; store
  result in register
- 'DIV': pop value from stack and divide it into register value; store *integer*
  result in register
- 'MOD': pop value from stack and divides it into register value; store *integer*
  remainder of division in register
- 'POP': remove the topmost item from the stack and place in register
- 'PRINT': print register value
data structure: 
- array: integers and command operations
- case statement
algorithm: 
- init. variable register = 0
- split string into an array of words and integers
  - save to variable program = string.split
- create an empty array to hold stack integers
  stack = []
- iterate over array and pass in each integer and command
  - assign register to program[0] (first integer is register value 'n')
- create a case statement to store all operations
  - case operation
  when 'n' then register << n
  when 'PUSH' then stack << register
  when 'ADD' then register += stack.pop
  when 'SUB' then register -= stack.pop
  when 'MULT' then register *= stack.pop
=end

def minilang(program)
  stack = []
  register = 0

  program.split.each do |command|
    register = command.to_i if command.to_i != 0 

    case command
    when 'PUSH' then stack << register
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    end
  end
end

minilang('PRINT') # 0
minilang('5 PUSH 3 MULT PRINT') # 15
minilang('5 PRINT PUSH 3 PRINT ADD PRINT') # 5 3 8
minilang('5 PUSH POP PRINT') # 5
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') # 5 10 4 7
minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
minilang('-3 PUSH 5 SUB PRINT') # 8
minilang('6 PUSH') # nothing

