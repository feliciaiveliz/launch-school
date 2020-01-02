# Selection and Transformation

Besides *iteration* the two most common actions to perform on a collection are *selection* and *transformation*. 

Selection is picking certain elements out of a collection depending on some *criterion*. If there are `n` elements in a collection, selection results in `n` or less elements. These elements are put into a **new** collection.

Transformation refers to manipulating every element in the collection. Transformation always results in exactly `n` elements. These elements are put into a **new** collection.

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
- On `line 5` we invoke the `loop` method invocation, passing in the `do..end` block to it as an argument from `lines 5-14`. This defines a block and creates an inner scope. 
- On `line 6` we initialize local variable `current_char` and set it to reference the current character of the String object `alphabet` is referencing. We use string element reference and the variable `counter` to retrieve the letter at that index.
- From `lines 8-10` we use a conditional `if` statement to check to see if the current character is equal to `g`. If it is, we permanently append the character to the String object that `selected_char` is referencing.
- We increment the `counter` variable by `1` on `line 12`.
- We use keyword `break` to exit the `loop` if the Integer object that `counter` is referencing is equal to the length of the String object `alphabet` is referencing.
- On `line 16` we output the value of `selected_chars`, which is `g`.

***

```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do 
  current_element = fruits[counter]
  
  transformed_elements << current_element + 's'
  
  counter += 1
  break if counter == fruits.size
end

transformed_elements 
```

- This code will output the value of `transformed_elements`, which is `g`, and will `loop` method will return `nil`.
- On `line 1` we initialize the local variable `fruits` and set it to reference an Array object that contains `3` String objects.
- On `line 2` we initialize local variable `transformed_elements` and set it to reference an empty array object, `[]`.
- On `line 3` we initialize local variable counter and set it to reference Integer with a value of `0`. This variable is used to keep track of the number of iterations performed by `loop`.
- From `lines 5-12` we invoke the `loop` method invocation and pass in the `do..end` block to it as an argument. This defines a block and creates an inner scope. 
- On `line 8` we initialize local variable `current_element` and set it to reference the current element of the Array object `fruits` is pointing to. We use array element reference to retrieve the current element using the `counter` variable as the index.
- On `line 9` we append `s` to the current element referenced by the `current_element` variable, and save it to the array object `transformed_elements` is referencing.
- We increment the Integer object `counter` is referencing by `1`, on `line 11`.
- We use keyword `break` and a conditional `if` statement to exit the loop if the Integer `counter` is referencing is equal to the number of elements in the array referenced by `fruits`.
- This leaves the original array object unchanged.

***

```ruby
selected_chars = ''

if 'aeiouAEIOU'.include?(current_char)
  selected_chars << current_char
end
```

- On `line 3` we use a conditional `if` statement that checks to see if the current character, `current_char` is included in the string `aeiouAEIOU`, then that character will be added to the `selected_chars` string.

***

