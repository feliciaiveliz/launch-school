=begin

Start/Stop = oval
Processing Step = rectangle
Input/Output = rhombus
Decision = diamond
Connector = circle

Find the largest number in a collection.

START
GIVEN numbers as a collection of unsorted numbers

iterator = 0
saved_number = numbers[iterator]

IF iterator = numbers.length 
  stop
ELSE 
  numbers[iterator] > saved_number
IF the saved_number is > than the numbers[iterator](current number)
ASSIGN the numbers[iterator](current) as saved_number
Iterator = iterator + 1

Suppose flowchart is mapping put solution to part of a larger problem. 
We're asking user to give us N collections of numbers. We want to take the largest number of each collection and display it. 

***HIGH LEVEL PSUEDO_CODE.***

while user wants to keep going
  - ask the user for a collection of numbers
  - extract the largest one from that collection and save it
  - ask the user if they want to input another collection
return saved list of numbers



***FULL PSEUDO_CODE.***

while user wants to keep going
  - ask the user for a collection of numbers
  - iterate through the collection one by one
    - save the first value as the starting value
    - for each iteration, compare the saved value with the current value
    - if the saved value is greater, or the same
      - move to the next value in the collection
    - otherwise, if the current value is greater
      - reassign the saved value as the current value
    
  - after iterating through the collection, save the largest value into the list.
  - ask the user if they want to input another collection of numbers. 

return saved list of numbers


***TRANSLATED FORMAL PSEUDO-CODE.***

START 

SET large_numbers = []
SET keep_going = true

WHILE keep_going == true
  GET 'enter a collection' (input)
  SET collection
  SET largest_number = SUBPROCESS "extract the largest one from that collection"
  large_numbers.push(largest_number)
  GET "enter another collection?"
  IF 'yes'
    keep_going = true
  ELSE 
    keep_going = false
  IF keep_going == false
    exit loop
    
PRINT large_numbers 

END
