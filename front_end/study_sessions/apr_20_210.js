
"Remove occurances of the letter e after the word 'letter' in this sntnc"

/*
input: Object
output: new string with letter 'e's removed starting at word 'letter'
algorithm:
- save searchChar = 'e'
- split string into array of characters
- iterate over the array, given a character
- find index of the word "'letter'", save it to variable
  - add letters to the result string
  - if the index is equal to the letter word index:
    - && if the letter is equal to 'e'
    - skip over the letter and go on to the next
- return the new string
*/

const textObject = { text: "Remove occurances of the letter e after the word 'letter' in this sentence" };

function removeLetterE(object) {
  let letters = object.text.split('');
  let result = '';

  for (let idx = 0; idx < letters.length; idx++) {
    let startIdx = letters.indexOf("'");

    if (idx >= startIdx && letters[idx] == 'e') {
      continue;
    } else {
      result += letters[idx];
    }
  }

  return result;
}

Object.freeze(textObject);

console.log(removeLetterE(textObject)) === "Remove occurances of the letter  after the word 'lttr' in this sntnc";
