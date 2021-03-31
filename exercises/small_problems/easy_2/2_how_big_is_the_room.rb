=begin
Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet. Do not worry about validating the input at this time.

Note: 1 square meter == 10.7639 square feet

Inputs: 
- length in meters
  - ask for length as integer only
- width in meters
  - ask for width in integer only

Outputs: 
- statement that asks user for length
  - "please enter the length of the room in meters:"
- same statement but for width
  - "please enter the width of the room in meters:"
- display statement that calculates total area of the room in meters
  - and square feet. 
- result must be in float form to account for non-whole numbers

Examples: 
- Please enter the length of the room in meters:
  - 7
- Please enter the width of the room in meters: 
  - 7
- The total area of the room is 49.0 square meters. In sqaure feet, the total is 527.43.

Rules: 
- input has to be an integer number
- result has to be in float form
- conversion must include square feet

Data Structure:
- strings for asking for user input
- float multiplication 

Algorithm: 
- save square feet into variable called feet
  - feet = 10.7639
- ask user for length in meters
  - puts "Please enter the length of the room in meters: "
  - save integer into variable 'length'
- ask the user for width in meters
   - puts "Please enter the width of the room in meters: "
   - save integer into variable 'width'
- calculate area of the room
  - length * width 
  - ex. 7 x 4 = 28.0 sqaure meters
  - save calculation into variable - 'area'
- calculate square feet
  - area * square_feet 
  - save result into variable - square_feet
- display results
  - puts "The total area of the room is 28.0 square meters. In square feet, the total is 301.39."
=end

feet = 10.7639

puts "Please enter the length of the room in meters: "
length = gets.chomp.to_f

puts "Please enter the width of the room in meters: "
width = gets.chomp.to_f

area = length * width 
square_feet = area * feet 

puts "The total area of the room is #{area} sq. meters. In square feet, the total is #{square_feet}."
