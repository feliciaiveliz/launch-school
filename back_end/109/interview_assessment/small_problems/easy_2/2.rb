=begin

Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

input: integer
output: string that details area of a room
rules: 
- 1 sq meter == 10.7639
- to get feet: meters * 10.7639
pseudo-code: 
- ask user for length of room in meters
- convert the input to an integer
- ask user for the width of room in meters
- convert to integer
- output string that contains the area of the room in meters and sq feet
algorithm: 
- puts string "What is the length of the room in meters: "
- save result into variable called 'length' and convert to float
- puts string "What is the width of the room in meters: "
- save result into variable called 'width' and convert to float
- initialize variable 'area' and set it to length * width
- initialize variable 'sqft' and set it to area * 10.7639
- puts string "The area of the room is #{area} sq meters and #{sqft} sq ft"
=end

puts "Enter the length of the room in meters: "
length = gets.chomp.to_f

puts "Enter the width of the room in meters: "
width = gets.chomp.to_f

area = length * width
sqft = area * 10.7639

puts "The area of the room is #{area} square meters and #{sqft} square feet."
