# Small Problems Approach 

### Consider a character set consisting of letters, a space, and a point. Words consist of one or more, but at most 20 letters. An input text consists of one or more words seperated from each other by one or more spaces and terminated by 0 or more spaces followed by a point. Input should be read from, and including, the first letter of the first word, up to and including the terminating point. The output text is to be produced such that successive words are seperated by a single space with the last word being terminated by a single point. Odd words are copied in reverse order while even words are merely echoed.

For example, the input string: 
"whats the matter with kansas."

becomes: 
"what eht matter htiw kansas."

Understanding the problem: 
input: 
- 1 - many words
- seperated by: 1 - many spaces
- terminated by: 
  - 0 - many spaces
  - followed by a point
- chars: letter, space, point, up to 20 letters
- need to handle edge cases? 
output: 
- words: have the odd words reversed
- odd means odd numbered words - based on 0 indexing
- seperated by one space between words
- terminated: 0 spaces, followed by a period

Edge Cases:

```ruby
reverse_odd_words("hello.")        => "hello."
reverse_odd_words("hello .")       => "hello."
reverse_odd_words("hello world.")  => "hello dlrow."
reverse_odd_words("hello world .") => "hello dlrow."
reverse_odd_words("hello  world  .") => "hello dlrow."
reverse_odd_words("hello  hello world.") => "hello olleh world."
reverse_odd_words("")  => "."
```

***

Write a function that takes an integer year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century. 

Understand the Problem: 
input: 
- integer number
- need to validate?
output: 
- a string
- begins with century number
- ends with st, nd, rd, or th
rules: 
- new centuries begin in years that end with 01
- century string number into a string: 
  - 1: st
  - 2: nd
  - 3: rd
  - 4-20: th
  - 21: st
  - 22: nd
  - 23: rd
  - 24-30: th
  ...
  - generalize: 
    - century_number % 10
      - 1, 2, 3: st, nd, rd
      - 0, 4-9: th
    - except for 11, 12, 13