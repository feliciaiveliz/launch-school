// Write a function that takes a string as an argument and returns that string with a staggered capitalization scheme. Every other character, starting from the first, should be capitalized and should be followed by a lowercase or non-alphabetic character. Non-alphabetic characters should not be changed, but should be counted as characters for determining when to switch between upper and lower case.

/*
input: string of words
output: new string of alternating capitalized characters
rules:
- first letter capitalized
- second character will be lowercased or used as count to determine when to switch case
algorithm:
- declare result to ''
- create an array of all characters in the string
- even indexed spaces will be uppercased
- odd indexed spaces will be lowercased
- return result when all characters have been iterated over
*/

function staggeredCase(string) {
  let result = '';
  let characters = string.split('');

  for (let i = 0; i < characters.length; i += 1) {
    if (i % 2 === 0) {
      result += characters[i].toUpperCase();
    } else {
      result += characters[i].toLowerCase();
    }
  }

  return result;
}

console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 4444 nUmBeRs"
