=begin

Write a method that will take a short line of text, and print it within a box.

input: string
output: box
rules: 
- string will be printed within the box
- first line will start with +, then will continue for the length of string +2, then end with +
- second line will start with |, empty space continuing for length of string +2, then end with |
- third line will start with |, puts string +2, end with |
- fourth line same as second
- fifth line same as first
algorithm: 
- create print_in_box(string)
- assign outer_line to puts "+-#{string.size + 2}-+"
- assign inner_line to puts "|''#{string.size + 2} "
- assign string to puts " #{string} "
- puts inner_line
- puts outer_line
=end

def print_in_box(string)
  outer_line = "+ #{'-' * (string.size)} +"
  inner_line = "| #{' ' * (string.size)} |"
  str = "| #{string} |"

  puts outer_line
  puts inner_line
  puts str
  puts inner_line
  puts outer_line
end

p print_in_box('To boldly go where no one has gone before.')

