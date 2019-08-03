# Selection and Transformation

Besides *iteration*, the two most common actions to perform on a collection are **selection** and **transformation**.

- Selection - picking certain elements out of the collection based on a block's criteria. 
  - Example: pick out all the odd integers from an array.
- Transformation - manipulating every element in the collection. 
  - Example: increment all elements of the array by 1. 
If there are `n` elements in a collection, selection results in `n` or less elements. Transformation always results in exactly `n` elements. Both selection and transformation utilize the basics of looping: 
- a loop
- a counter 
- a way to retrieve the current value
- a way to exit the loop
S and T require *some criteria*:
- Selection uses this criteria to determine which elements are selected
- Transformation uses this criteria to determine how to perform the transformation

### Looping to Select and Transform

We want to select all `'g'` characters out of a string. This is a basic loop with one main condition: the `if` statement. 

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do 
  current_char = alphabet[counter]

  if current_char == 'g'
  selected_chars << current_char # appends current_char into the selected_chars string
  end

  counter += 1
  break if counter == alphabet.size
end

selected_chars # => 'g'
```

The `if` condition is what determines which values are selected and which ones are ignored; this is *selection criteria*. The rest of the code is the basic loop iterating code.

The same concepts can apply to transformation. We again are going to take a simple array and loop through it, but with one difference: the modification of appending an `'s'` to each string in the array. 

```ruby
fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do 
  current_element = fruits[counter]
  transformed_elements << current_element + 's' # appends transformed string into array

  counter += 1
  break if counter == fruits.size
end

transformed_elements  # => ["apples", "bananas", "pears"]
```

Since the transformation is applied to every element in the array, we don't need an `if` condition, but the entire line is the **transformation criteria**. In this example, the transformation is performed on a new array and the original array is left unchanged. **When performing transformation, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned.**

## Extracting to Methods

Most of the time, selecting or transforming a collection is a very specific action: select all the odd numbers, turn all elements into strings, etc. This naturally lends the specific action being extracted into convenience methods. 

For example: if we wanted to be able to select all of the vowels in a given string. Use the helpful `String#include?` method to assist in determining whether a character is a vowel. 

```ruby
if 'aeiouAEIOU'.include?(current_char)
  selected_chars << current_char
end
```

Put it all together into a `select_vowels` method so we can call this method on any string.

```ruby
def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do 
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end
  
    counter += 1
    break if counter == str.size
  end

  selected_chars
end
```

When our method is done iterating over the collection, it *returns a new collection containing the selected values.* The `selected_vowels` method returns a new string.

```ruby
select_vowels('the quick brown fox') # => 'euioo'

sentence = 'I wandered lonely as a cloud' # => 'Iaeeoeaaou'
select_vowels(sentence)
```

We can therefore call other methods on that return value.

```ruby
number_of_vowels = select_vowels('hello world').size
number_of_vowels # => 3
```

We want to select the key-value pairs where the value is `'Fruit'`.


*******************************************************
```ruby

produce = { 
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_produce(hash)
  selected_produce = {}

  loop do 
    produce.select |key, value|
      if key.include?('Fruit')
      selected_produce << 

select_fruit(produce) 
```
```ruby
def select_fruit(produce_list)
  produce_keys = produce_list.keys # assigns array of keys to produce_keys
  counter = 0 # this will help to iterate over keys 
  selected_fruits = {} # new array will be stored here

  loop do 
    break if counter == produce_keys.size # this is needed in case produce_list is empty hash

    current_key = produce_keys[counter] # current iteration, first it will be first element in produce_keys array
    current_value = produce_list[current_key] # ref. hash, at the current key, pointing to the value

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end
```

Note: 
- the original argument `produce_list` is not mutate
- a new hash is returned by the method (as opposed to an array or string)

Moving on to the transformation examples where the entire transformation code is within a method definition. The code below multiplies each in the collection by 2. 

```ruby
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do 
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
doubled_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
```

The `double_numbers` method returned a new array with every element doubled and the original array is not mutated. Implement an approach that mutates the method argument using `double_numbers!`.

```ruby
def double_numbers!(numbers)
  counter = 0

  loop do 
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2 # shortened to numbers[counter] = numbers[counter] * 2 or numbers[counter] *= 2

    counter += 1
  end

  numbers
end
```

Check answers: 
```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)   # => [2, 8, 6, 14, 4, 12]

my_numbers                    # => [2, 8, 6, 14, 4, 12]
```
Transformation is an operation that is performed on **every element** in the collection. The next method only transforms a subset of the elements in the collection. Here we only multiply by `2` if the value is odd. The `if` condition will only evaluate to `true` if `current_number` is odd(we check using `Integer#odd?`). 

```ruby
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end
```
This method does not mutate its argument and instead returns a new array. 

```ruby
my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]
```

What if we wanted to transform the numbers based on their position in the array rather than their value?

* I got this right!!
```ruby
def doubled_index(numbers)
  doubled_numbers = []
  counter = 0

  loop do 
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end
```

We now want a more generic `general_select` method so that we can specify whether we're interesting in selecting fruits or vegetables. 

```ruby
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do 
    break if counter == produce_list.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end
```

To use the above method, we have to pass in a collection and some *selection criteria*. The criteria is hardcoded to match with a value: if there's a match between the criteria and value, then the current key-value pair is selected into the `selected_produce` hash. Here's how to use it: 

```ruby
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}
```

Update `doubled_numbers` method to double the values in an array and also multiply by any number. We'll create a method called `multiply` that can take an additional argument to determine the *transformation criteria*. 

```ruby
def multiply(numbers, multiplier)
  doubled_numbers = []
  counter = 0

  loop do 
    break if counter == numbers.size

    current_value = numbers[counter]
    current_value *= multiplier
    doubled_numbers << current_value # or

    doubled_numbers << numbers[counter] * multiplier

    counter += 1
  end
  
  doubled_numbers
end
```

Write a method called `select_letter` that takes a string and returns a new string containing only the letter that we specified. We want it to behave like this:

```ruby
question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""
```
```ruby
def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do 
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end
```

Since `select_letter` returns a string, if we wanted to we could continue to chain string methods on the return value. If we wanted to find how many times a letter occurs in a sentence, we could use our method above chained with `String#size` like so:

```ruby
select_letter(question, 'a').size # => 8
select_letter(question, 't').size # => 5
select_letter(question, 'z').size # => 0
```
*Note that the return value of the entire expression is an integer.

### The `for` loop 

We've been using the `Kernel#loop` method in the examples to show how to loop over a collection. The `for` loop produces the same result as `loop`. 

```ruby
alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end
```

`String#chars` splits each character into its own element in the array. `char` represents the value of the current element in the array. 

### Summary

Understand how these methods can be made more generic by allowing for additional parameters to specify some *criteria* for selection or transformation. Pay attention to the return value, especially if it is an empty collection or `nil`. Pay attention to when the original collection is mutated vs when the method returns a new collection. 

