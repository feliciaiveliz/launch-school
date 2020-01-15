=begin

Write a method that will take a short line of text, and print it within a box.

input: string
output: string within a box
rules:
- 5 puts statements in total
- 2 will draw top/bottom of box
- 2 will draw left/right sides of box
- 1 will print string in center of box
data structure: string
pseudo-code: 
- print statement to output top/bottom line
- find size of string, +2 to cover the start/end of string
algorithm: 

=end

def print_in_box(str)
  pad = str.size
  puts "+-#{"-" * pad}-+"
  puts "| #{" " * pad} |"
  puts "| #{str} |"
  puts "| #{" " * pad} |"
  puts "+-#{"-" * pad}-+"
end

p print_in_box('To boldly go where no one has gone before.')
p print_in_box('')