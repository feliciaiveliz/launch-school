// Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

/*
Input:
- string of letters
- string can be of any length
Output:
- array of substrings
  - substrings start at index position 0
  - each substring adds one letter
  - the list of substrings ends at the last letter in the input string
  - each set of substrings starts with a new letter at index 0
Rules:
- all substrings start at index 0
- order the substrings from shortest to longest
- can the input string be modified or should I deal with a copy of input string?
Example:
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
'a' -> 'ab' -> 'abc' -> 'abcd' -> 'abcde' -> 5 letters
 0  ->  01  -> 012   ->  0123  ->  01234
 'b' -> 'bc' -> 'bcd' -> 'bcde' -> letters
 0  -> 01   -> 012    -> 0123
Data Structure:
- Input:
  - string
- Output:
  - array
    - substrings are strings
Mental Model
- create a 'result' array to hold substrings
- loop:
  - until we reach the last letter in the 'set' string
    - create substring:
      - start at 0 and slice out letter
      - on the next iteration, slice out letters from 0 up to +1
      - do this until we reach the end of the string
    - chop off first letter of input string
      - repeat steps:
      - create substring:
      - start at 0 and slice out letter
      - on the next iteration, slice out letters from 0 up to +1
      - do this until we reach the end of the string
  - loop until the input string is empty
- return result array
Algorithm:
- create 'result' as an empty array to hold substrings
- loop until input string is empty
  - create 'index' variable- set to 1
  - while input string length is not 0:
    - slice out substrings:
      - push to 'result': slice(0, index)
      - increment 'index' by 1
  - when 'index' > input string length
    - slice out first letter of input string
    - reassign the new string back to 'input string'
    - reset 'index' to 1 to start new set of substrings 
      - starting at slice(0) plus index (1)
- return 'result'
*/

function substrings(string) {
  let result = [];
  let index = 1;
  
  while (string.length !== 0) {
    result.push(string.slice(0, index));
    index += 1;
    
    if (index > string.length) {
      string = string.slice(1, string.length);
      index = 1;
    }
  }
  
  return result;
}

console.log(substrings('abcde')); // == [
//   'a', 'ab', 'abc', 'abcd', 'abcde',
//   'b', 'bc', 'bcd', 'bcde',
//   'c', 'cd', 'cde',
//   'd', 'de',
//   'e'
// ]

// [
//   'a',     'ab',
//   'abc',   'abcd',
//   'abcde', 'bcde',
//   'cde',   'de',
//   'e'
// ]

// [
//   'a',    'ab',    'abc',
//   'abcd', 'abcde', 'b',
//   'bc',   'bcd',   'bcde',
//   'c',    'cd',    'cde',
//   'd',    'de',    'e'
// ]