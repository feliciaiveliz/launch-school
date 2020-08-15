=begin
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 
The program must compute the tip and then display both the tip and the total amount of the bill.

Inputs: 
- the user gives us bill amount
  - bill inputs as integer
  - must be > 0
- tip amount inputs as integer
  - tip has to be > 0

Outputs:
- display the total tip
  - must start with $ sign
  - round to two decimal places
  - must account for float numbers
- total bill amount 
Example:
- What is the bill amount?
  - 200
- What is the tip percentage?
  - 15
- The tip amount is $30.00
- The total bill amount is $230.00

Algorithm: 
- create initial_bill variable 
  - set it equal to empty string
  - initial_bill = ''
- create tip_percentage variable
  - tip_percentage = ''
- create loop that asks for these amounts:
  - puts "What is the bill amount?"
  - initial_bill = gets.chomp
  - if initial_bill <= 0
    puts "Please enter only a positive number."
  - else break
- puts "What is the tip percentage?"
  - if tip_percentage <= 0 
    puts "Please enter only a positive number."
  - else break
  - end loop
- calculate tip_total
  - tip_total = initial_bill * (tip_percentage * .01)
- calculate bill_total
  - bill_total = initial_bill + tip_total
- puts "The total tip is #{tip_total}"
- puts "The total bill amount is #{bill_total}"
=end

initial_bill = ''
tip = ''

loop do 
  puts "What the bill amount?"
  initial_bill = gets.to_i
  if initial_bill <= 0
    puts "Please enter only a positive number."
  else
    break
  end
end

loop do
  puts "What is the tip percentage?"
  tip = gets.to_i
  if tip <= 0
    puts "Please enter only a positive number."
  else
    break
  end
end

tip_amount = tip * 0.01
tip_total = initial_bill * tip_amount
bill_total = initial_bill + tip_total

puts "The total tip is $#{tip_total.to_f}."
puts "The total bill amount is $#{bill_total.to_f}."