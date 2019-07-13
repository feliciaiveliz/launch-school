### Understand the Problem

Inputs: 
1) loan amount in USD
2) APR 
3) loan duration in years

Outputs: 
1) monthly interest rate 
2) loan duration in years

Formula:
m = p * (j / (1 - (1 + j)**(-n)))

Keys:
m = monthly payment amount
p = loan amount
j = interest rate 
n = loan duration in months

Start
 - Require yaml file including all messages
   - language - en 
1) Greet user with "Welcome to the Mortgage Loan Calculator!"
2) Ask user for name:
   - create method for verification:
     - no empty spaces, or spaced answers
   - create loop in body that repeatedly asks until correct name is given; error message
     - if correct, break out of loop. 
3) Greet user again with name, then proceed to ask questions:
4) Ask "What is the loan amount in USD?"
   - create method before loops section that validates the number. 
     - Float? Integer? Integer?(both) 
   - retrieve user's answer 
     - save to variable
   - (loop) if answer is blank or negative
     - prompt with error message, otherwise break out of loop
   - move on to next question
5) Ask "What is the apr?" Specify formats for clarity: 
   - create method; validate if it's correct, same applies as before. 
   - retrieve answer
     - save to variable
   - (loop) if answer is blank or negative
     - prompt with error message, otherwise break out of loop
   - move on to next question
6) Ask "What is the loan duration in years?
   - Conversion: 12 months to a year
     - retrieve user's answer
       - save to variable
   - (looping construct) if blank, or negative
     - prompt with error message
   - move on to the next section
7) Calculations
 - monthly interest rate
 - duration in months (and years?)
8) Print result for user
9) Ask "Would you like to perform another calculation?"
   - retrieve answer
     - if yes, clear screen and start again
     - if no, display goodbye message
     - if not either, display error message that loops repeatedly until it's correct
10) Print "Thank you for using the Mortgage Calculator! Good-bye, name!"

End

What methods will I need?

1) name? -name can't be a number, or a blank space, or a spaced entry
2) number? -validates for both integers and floats
3) integer? -greater than 0, can't be empty or space
4) calculate_monthly_payment? -extract formula into method for readability?
5) answer? -if y, clear and start over; n, break; not either, error message

What loops will I need?

1) name = '' Ask user for name, loops until correct using valid_name? method. Break if so, error message otherwise.
2) (main loop) amount = '' Ask user for loan amount, using valid_number?(valid_amount). Break if correct, error message otherwise.
3) (main loop) apr = '' Ask user for interest rate, using valid_number?(valid_interest). Break if correct, error message otherwise.
4) (main loop) duration = '' Ask user for loan duration, using loan_duration?(valid_duration). Break if correct, error message otherwise.

Calculations: 
annual_interest = interest.to_f() / 100
monthly_interest = annual_interest / 12
months = years.to_i * 12
monthly_payment = amount.to_f *
                  (monthly_interest /
                  (1 - (1 + monthly_interest)**(-months.to_()))
                  