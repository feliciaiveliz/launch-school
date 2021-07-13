// Write a function that takes an array of strings and returns an array of the same string values, but with all vowels (a, e, i, o, u) removed.
//

/*
input: array of strings of letters
output: new array of strings of letters with vowels removed
rules:
- vowels are a, e, i , o and u
algorithm:
- iterate over the array of words:
  - for each word, replace the vowels with empty string
- return the new array
*/

function removeVowels(array) {
  return array.map(word => word.replace(/[aeiou]/gi, ''));
}

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));         // ["bcdfghjklmnpqrstvwxyz"]
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));  // ["grn", "YLLW", "blck", "wht"]
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                // ["BC", "", "XYZ"]
