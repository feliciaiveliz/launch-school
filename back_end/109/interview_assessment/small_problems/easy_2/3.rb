=begin

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

input: integer: bill amount and tip percent
output: integer: tip total and total bill amount
rules: 
- to calc. tip
  - bill amount * tip percentage (.15)
- to calc. bill total
  - bill amount + tip == bill total
pseudo-code: 
- ask user for bill amount
- save into variable called 'bill_amount'
- convert to float
- ask user for tip percentage
- save into variable called 'tip_percent'
- convert to float
- calculate tip_total
  - tip * 0.01
  - bill amount * tip_total
- calculate bill_total 
  - bill_amount + tip_total
- save the result into a variable called 'bill_amount'
- output results
=end

puts "What is the bill?"
bill_amount = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f

tip_total = ((tip_percent * 0.01) * bill_amount)
bill_total = bill_amount + tip_total

puts "The tip is $#{format("%.2f", tip_total)}."
puts "The total bill amount is $#{format("%.2f", bill_total)}."





