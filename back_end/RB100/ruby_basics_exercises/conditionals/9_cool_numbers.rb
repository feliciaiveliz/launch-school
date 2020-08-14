# In the code below, number is randomly assigned a number between 0 and 9. Then, an if statement is used to print "5 is a cool number!" or "Other numbers are cool too!" based on the value of number.

number = rand(10)

if number = 5 # this is assignment, which will always evaluate to 5, which will result in the expression always evaluating to true
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

# needs to be changed to 

number = rand(10)

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

