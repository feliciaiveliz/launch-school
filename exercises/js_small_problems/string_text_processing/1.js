// Write a function that takes a string argument and returns true if all of the alphabetic characters inside the string are uppercase; otherwise, return false. Ignore characters that are not alphabetic.

/*
input: string of characters
output: boolean - true if all alpha. characters inside string are uppercase
rules:
- ignore characters that are not alphabetic
algorithm:
- return:
  - compare two strings: one is the original string, the other is capitalized
  - this is will check if the original string is equal to the string if it's uppercased
  - if it is, this means that the original string contains all uppercased letters
*/

function isUppercase(string) {
  return string === string.toUpperCase();
}

console.log(isUppercase('t'));               // false
console.log(isUppercase('T'));               // true
console.log(isUppercase('Four Score'));      // false
console.log(isUppercase('FOUR SCORE'));      // true
console.log(isUppercase('4SCORE!'));         // true
console.log(isUppercase(''));                // true
