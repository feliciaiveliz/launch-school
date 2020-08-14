# Introduction to PEDAC Process

Primary goal: Help identify and avoid pitfalls that you encounter when you don't code with intent. 

P - [Understand the] **P**roblem

E - **E**xamples/Test Cases

D - **D**ata Structure

A - **A**lgorithm

C - **C**ode

Writing out the pedac process saves time and lets you solve complex problems efficiently. For extremely simple problems, writing an algorithm is unnecessary but it is crucial to solving complex problems in a short amount of time. 

p - [Understand the] **P**roblem

This has 3 steps: 

1. Read the problem description
2. Check the test cases, if any
3. If any part of the problem is unclear, ask the interviewer to clarify

Problem: 
```ruby
# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
```

This might need clarification: 

1. **What is a palindrome?** A word that reads the same forward and backward.

2. **Should the words in the string remain the same if they already use uppercase?** Check the test cases. The word `LOVE` already uses uppercase and it remains that way in the solution.

3. **How should I deal with empty strings provided as input?** The test cases provide the answer.

4. **Can I assume that all inputs are strings?** The test cases don't show any non-string inputs, so still ask whether the inputs can contain non-string values.

5. **Should I consider letter case when deciding whether a word is a palindrome?** Ask interviewer, in this case palindrome words should be case sensitive; `'mom'` is a palindrome, `'Mom'` is not.

6. **Do I need to return the same string object or an entirely new string?** This is one of the most important questions and also most overlooked. For this problem, you should return an entirely new string. Always ask the interviewer for clarification before time is spent doing the problem incorrectly. 

7. **Always verify your assumptions either by looking at the test cases or by asking the interviewer.** Most assumptions can be verified by looking at the problem description, or by checking the test cases. 

Write down the inputs and outputs for the problem. Describe the rules that need to be followed. The rules should contain all the explicit and implicit requirements in the problem. Identify what the explicit requirements are, write them down and repeat the process for the implicit requirements. 

```ruby
# input: string
# output: string (not the same object)
# rules: 
# - Explicit requirements: 
#   - every palindrome in the string must be converted to uppercase. 
#   - a palindrome is a word that reads the same forwards and backwards.
#   - palindromes are case sensitive ('Dad' is not a palindrome, but 'dad' is.)
# - Implicit requirements: 
#   - the returned string shouldn't be the same string object. 
```

**D**ata Structure/ **A**lgorithm
Data Structures influence your algorithm, so these two steps are often paired. Deciding what data structures to use is generally easy, however designing the right algorithm is more challenging. The biggest problem is providing sufficient detail. 

For another problem, write the inputs/outputs/rules and compare to the LS solution. 

```ruby
# Given a string, write a method `palindrome_substrings` which returns all the substrings from a given string which are palindromes. Consider palindrome words case sensitive.

# Test Cases:
# palindrome_substrings('supercalifragilisticexpialidociious') == ['ili']
# palindrome_substrings('abcddcbA') == ['bcddcb', 'cddc', 'dd']
# palindrome_substrings('palindrome') == []
# palindrome_substrings('') == []
```
```ruby
# inputs: string
# output: array of new substrings
# rules: 
  # - explicit: 
  #   - returns new strings that are palindromes 
  #   - palindrome words are case sensitive
  #   - 'Dad' is not the same as 'dad'
#   - implicit: 
#     - palindromes are words that read the same forwards and backwards
#     - these are not the original strings
#     - if string is not palindrome, or is empty, return an emtpy array
# questions: 
# 1. What is a palindrome?
# 2. Will all inputs be strings? 
# 3. What are substrings? 
# 4. Will the strings be new strings, or are we returning the original string? 
# What do I return if the string does not contain substrings of palindromes, or is empty? 
# data structure: array
```

Look at this algorithm: 

```ruby
# - initialize a result variable to an empty array
# - create an array named substring_arr that contains all of the substrings of the input string that are at least 2 characters long
# - loop through the words in the substring_arr array.
# - if the word is a palindrome, append it to the result array
# - return the result array
```

1. Determining whether a word is a palindrome isn't that difficult
- check if the string reverse is the same as the original string
2. Looping through an array and selecting all the palindromes isn't too difficult
3. Finding all the substrings within the string can be challenging.
- the algorithm above doesn't tackle that problem
4. The student should try to find a way to find all the substrings of the input string. They might create a new method called `substrings` that returns the array of substrings. 


To find the right algorithm, take a small concrete sample and use it to determine how you will approach the problem. 
1. Take a short word like `halo` and write all the substrings that are two characters in length or longer
- ["ha", "hal", "halo", "al", "alo", "lo"]
2. Beginning with 'h', we first find all the substrings that begin with that letter: ["ha", "hal", "halo"]. 
3. This is showing a loop: first we are returning a substring that begins with the first letter and ends with the second, then a substring that ends with the third, and lastly a substring that ends with the last letter. 
4. Continuing with this, we now find all of the substrings that begin with the second letter. This is ["al", "alo"] in addition to the 3 substrings from before. We repeat the process to get all of the substrings that start with the 3rd letter, 'l', which contains one value. ['lo']. 

One way to solve the problem is to use an outer loop that tracks the index of the first letter of each substring, and an inner loop that tracks the index of the last letter of each substring. 

```ruby
- create an empty array called `result` that will contain all the required substrings
- initialize variable start_substring_idx and assign 0 to it
- initialize variable end_substring_idx and assign value of start_substring_idx + 1 to it.
- enter loop that will break when start_substring_idx is equal to str.size
  - within that loop enter another loop that will break if end_substring_idx is equal to str.size
    - append to the result array part of the string from start_substring_idx to end_substring_idx
    - increment `end_substring_idx` by 1.
  - end inner loop
  - increment start_substring_idx by 1
  - reassign end_substring_idx to start_substring_idx += 1
- end outer loop
- return `result` array
```

The code might look like this: 

```ruby
def substrings(str)
  result = []
  start_substring_idx = 0
  end_substring_idx = start_substring_idx + 1
  loop do 
    break if start_substring_idx == str.size
    loop do
      break if end_substring_idx == str.size
      result << str[start_substring_idx..end_substring_idx]
      end_substring_idx += 1
    end
    start_substring_idx += 1
    end_substring_idx = start_substring_idx + 1
  end
  result
end
```
Checking whether or not the string is a palindrome is easy, but we could the method for it and include it in the algorithm: 

```ruby
- inside the `is_palindrome?` method, check whether the string value is equal to its reversed value.
```
```ruby
def is_palindrome?(str)
  str == str.reverse
end
```

Complete **pseudo-code** for problem: 

input: string
output: array of substrings
rules: substrings must be case sensitive palindromes, meaning 'abbA' is not a palindrome'

algorithm: 
```ruby
# substrings method
# =================
# - create an empty array called 'result' that will contain all of the required substrings
# - initialize variable start_substring_idx and assign it to 0
# - initialize variable end_substring_idx and assign it to start_substring_idx += 1
# - enter loop that will break when start_substring_idx == to str.size - 1
#   - within that loop, enter another loop that will break when end_substring_idx == str.size
#   - append to the result array part of the string from start_substring_idx to end_substring_idx
#   - increment 'end_substring_idx' by 1
# - end inner loop
# - increment start_substring_idx by 1
# - reassign end_substring_idx to start_substring_idx += 1
# - end outer loop

# - is_palindrome? method
# =======================
# - check whether the string value is equal to its reversed value
# - use String#reverse method

# - palindrome_substrings method
# ==============================
# - initialize a result variable to an empty array
# - create an array named substring_arr that contains all of the substrings of the input string that are at least 2 characters long
# - loop through the words in the substring_arr array
#   - if the word is a palindrome, append it to result array
# - return result array
```

Code: 

```ruby
def substrings(str)
  result = []
  start_substring_idx = 0
  end_substring_idx = start_substring_idx + 1
  loop do 
    break if start_substring_idx == (str.size - 1)
    loop do 
      break if end_substring_idx == str.size
      result << str[start_substring_idx..end_substring_idx]
      end_substring_idx += 1
    end 
  start_substring_idx += 1
  end_substring_idx = start_substring_idx + 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end
```

There is more than one way to write the substrings method. 

```ruby
def substrings(str)
  result = []
  0.upto(str.size - 2).each do |start_idx|
    (start_idx + 1).upto (str.size -1) do |end_idx|
      result << str[start_idx..end_idx]
    end
  end
  result
end
```
You need to write a complete algorithm for a problem, including all the hard parts. If you can't write a plain Neglish solution to the problem, you won't be able to solve it in code either. 