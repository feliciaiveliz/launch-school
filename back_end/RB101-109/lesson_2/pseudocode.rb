=begin

# Write a method that returns the sum of two integers

Greet user. 
  - ask user for first number.
    - store that number in a descriptive variable to be used later.
    - convert number(string) to an integer.
    - remove newline character.
  - ask user for second number.
    - store that number in a descriptive variable to be used later.
    - convert number(string) to an integer.
    - remove newline character.
Perform addition.
  - save result into new variable
  - give statement for answer- "The result is ..."
  - ask user if they want to input another set of numbers.
  - if not, display goodbye message and close out the program.


# Given two integers that will be used in a mathematical operation.

START

GET user_number
SET first_number = user_number
  IF user_num == integer
    go to next prompt
  ELSE
    display error message, only integers 
  END

GET user_number
SET second_number = user_number
  IF user_num == integer
    go to next prompt
  ELSE
    display error message, only integers 
  END

READ first_number + second_number = result

PRINT result

GET user_input again if user wants to do this again
  IF true
    do it again
  ELSE
    quit program
  END
END

# ******************************************************************* 

# Write a method that takes an array of strings and returns a string that is all of those strings concatenated together.

- Create an empty array.
- Greet user.
- Ask user to input a string
   - do this on a loop
   - store those strings into a variable so that when we add those strings later, we can simply add variable itself in a method.
- Break out of loop when user doesn't want to add anymore strings
- Store strings in empty array
   - use method to push them all to the array
- Perform method on array that will concatenate each string
   - join with "." to seperate
- Return new string with all strings concatenated



START

SET array_of_str = []

GET user_input = user_strings
  IF user wants to stop adding strings
     break out of loop
  ELSE
     keep looping through
END

READ array_of_str << user_strings 

array_of_str.join!(". ")

PRINT array_of_str

END

# ****************************************************

# Write a method that takes an array of integers 
and returns a new array with every other element.

- Given array of integers
- Create empty array that will hold the new integers
  - Iterate throught the collection of integers and create a loop
  that will skip every other element. -Next
  - If integer is even, skip it
  - Else push integer to new array
  - Set counter
- Print new array


START
GET array of integers
 - ary

SET ary_of_integers = []
iterator = 0
iterator = iterator + 1

WHILE ary < length of array # this evaluates until false, or in this case empty
  IF value odd
    next to even integer
  ELSE
    ary_of_integers.push(ary)(even)
  END
END of loop
PRINT ary_of_integers
  
=end