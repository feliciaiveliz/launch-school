// Write a function that takes a string argument and returns a list of substrings of that string. Each substring should begin with the first letter of the word, and the list should be ordered from shortest to longest.

/*
input: string that contains at least one letter
output: array of substrings
rules:
- each substring will start with first letter of word
- list will be ordered from shortest string to longest string
algorithm:
- declare 'result' to []
- declare 'sliceIndex' to 0
- for loop:
  - make slice
*/

function leadingSubstrings(string) {

}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
