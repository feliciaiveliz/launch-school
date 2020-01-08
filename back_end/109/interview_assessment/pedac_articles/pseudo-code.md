# Pseudo-Code

Which number is greatest in a collection?

```ruby
Given a collection of integers.
    
Iterate through the collection one by one. 
  - save the first value as the starting value
  - for each iteration, compare the saved value with the current value 
  - if the saved value is greater, or it's the same 
    - move to the next value in the collection
  - otherwise, if the current value is greater
    - reassign the saved value as the current value

After iterating through the collection, return the saved value
```

When you approach a problem, it's important to understand it well. This is loading the problem into your brain. There are two layers to solving any problem: 

1. The logical problem domain layer
2. The syntactical programming language layer

***

### Formal Pseudo-Code

Use words, but use keywords to help break down the program logic into concrete commands. This will make translating to program code easier. 

| keyword         | meaning                               |
| --------------- | ------------------------------------- |
| START           | start of the program                  |
| SET             | sets a variable we can user for later |
| GET             | retrieve input from user              |
| PRINT           | displays output to user               |
| READ            | retrieve value from variable          |
| IF/ELSE IF/ELSE | show conditional branches in logic    |
| WHILE           | show looping logic                    |
| END             | end of the program                    |



```
START

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator <= length of numbers
  SET current_number = value within numbers collection at space 'iterator'
  IF saved_number >= current_number
    go to the next iteration
  ELSE 
    saved_number = current_number
    
   iterator = iterator + 1
 
 PRINT saved_number
 
 END
```

***

### Translating Pseudo-Code to Programming Code

```ruby
def find_greatest(numbers)
  saved_number = nil
    
  numbers.each do |num|
    saved_number ||= num
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end
  saved_number
end
```

