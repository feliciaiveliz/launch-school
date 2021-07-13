// Write a function that takes a string as an argument and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.

/*
input: string of words
output: same string with each letter swap cased
rules:
- lower to upper
- upper to lower
- all other characters are unchanged
algorithm:
- iterate over string of characters, given character:
  - if char is a lower letter, uppercase it
  - if char is an upper letter, downcase it
  - leave all other characters as is
- return string
*/

function swapCase(string) {
  return string.split('').map(letter => {
    if (/[a-z]/.test(letter)) {
      return letter.toUpperCase();
    } else if (/[A-Z]/.test(letter)) {
      return letter.toLowerCase();
    } else {
      return letter;
    }
  }).join('');
}

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"
