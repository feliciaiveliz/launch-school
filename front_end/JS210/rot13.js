/*
input: string of words
output: new string of words
rules:
- each character will be replaced by a new character 13 places later
- if at the end of the alphabet, start over from the start of the alphabet
- preserve letter case
- if not a letter of the alphabet, add character to new string as is
algorithm:
- declare a constant called upper to 'A' to 'Z'
- declare a constant called lower to 'a' to 'z'
-
*/

const lower = 'abcdefghijklmnopqrstuvwxyz';
const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function rot13(string) {
  let result = '';

  for (let index = 0; index < string.length; index++) {
    letter = string[index];
    if (lower.includes(letter)) {
      result += lower[(lower.indexOf(letter) + 13) % 26];
    } else if (upper.includes(letter)) {
      result += upper[(upper.indexOf(letter) + 13) % 26];
    } else {
      result += string[index];
    }
  }

  return result;
}

// function rot13(string) {
//   string = string.split('');
//   let result = '';
//
//   for (let index = 0; index < string.length; index++) {
//     letter = string[index];
//     if (letter >= 'a' && letter <= 'z') {
//       let thirteenthLetter = lowerCase[(lowerCase.indexOf(letter) + 13) % 26];
//       result += thirteenthLetter;
//     } else if (letter >= 'A' && letter <= 'Z') {
//       let thirteenthLetter = upperCase[(upperCase.indexOf(letter) + 13) % 26];
//       result += thirteenthLetter;
//     } else {
//       result += string[index];
//     }
//   }
//   return result;
// }

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
