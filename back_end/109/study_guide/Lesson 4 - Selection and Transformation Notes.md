# Selection and Transformation

Besides *iteration* the two most common actions to perform on a collection are *selection* and *transformation*. 

Selection is picking certain elements out of a collection depending on a some criterion. If there are `n` elements in a collection, selection results in `n` or less elements.

Transformation refers to manipulating every element in the collection. Transformation always results in exactly `n` elements.

Selection and transformation both utilize the basics of looping:

- a loop
- a counter
- a way to retrieve the current value
- a way to exit the loop

Both of these actions require *some criteria*; selection uses this criteria to determine which elements are selected and transformation uses this criteria to determine how to perform the transformation.

***

### Looping to Select and Transform

Example: 

Select all `g` characters out of a string using `loop` and an `if` statement.

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do 
  current_char = alphabet[counter]
  
  if current_char == 'g'
    selected_chars << current_char
  end
    
  counter += 1
  break if counter == alphabet.size
end

selected_chars
```

- The `if` condition is what determines what values are selected and which ones are ignored. This is the *selection criteria*.
- This code returns the value of the `selected_chars` string, which is `g`.
- On `line 1` we initialize local variable `alphabet` and set it to reference a String object with a value of letters `a-z`.
- On `line 2` we initialize local variable `selected_chars` and set it to reference an empty string `''`.
- On `line 3` we initialize local variable `counter` and set it to reference an Integer object with a value of `0`.
- On `line 5` we invoke the `loop` method invocation, passing in the `do..end` block to it as an argument. This defines a block and creates an inner scope. 