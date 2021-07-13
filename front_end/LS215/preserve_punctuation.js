function preservePunctuation(array) {
  let result = array.map((word) => {
    let puncIndexes = {};

    [...word].forEach((character, index) => {
      if (/['.?!]/.test(character)) {
        puncIndexes[index] = character
      }});

    word = word.replace(punctuation, '').split('').reverse().join('');

    Object.keys(puncIndexes).forEach(punc => {
      let array = word.split('');
      array.splice(Number(punc), 0, puncIndexes[punc]);
      word = array.join('');
    });
    return word;
  });
  return result;
}

let punctuation = /['.?!]/g;

}


/* --> PEDAC

problem/rules:
  - return a new arr (do not mutate the argument)
  - given an array of strings, reverse the chars in each string except for punctuation, which stays at the same index
  - there may be multiple punc chars in a given string ('?!.,)
  - strs with no punc are simply reversed.


input: one array of strings
output: one (new) array of strings
clarify questions:
- How should we account for numbers? => Assume that there are no numbers or they will be treated as word chars

test cases:
"shan't" => "tnah's"
"y'all'rn't" => "t'nrl'la'y"
"rabbit" -> "tibbar"
"" -> ""
"''?" -> "''?"

data structure:
- New array that contains all original values of input array
- Object
  - key -> index of punctuation
  - value -> punctuation

algorithm:
  - declare (result) and assign it to the return value of calling map on the given array argument
  - iterate through given array
    - for each str element
      - declare (workingObj) to {}
      - iterate through str
      - if char is punc, insert that index and punc mark into (workingObj)
    - after all chars iterated through,
      - remove all punc from str
    - reverse string
    - iterate over the key value pairs in the hash
    - insert the value at the index using the key (original index of the punctuation)
    - return the string on each iteration
  - return (result)
*/

function preservePunctuation(arr) {
  let result = arr.map((str) => {
    let workingObj = {};
    [...str].forEach((char, idx) => {if (/['.?!]/.test(char)) { workingObj[idx] = char }});
    str = str.replace(/['.?!]/g, '');
    str = str.split('').reverse().join('');
    Object.keys(workingObj).forEach(key => {
      let array = str.split('');
      array.splice(Number(key), 0, workingObj[key]);
      str = array.join('');
    });
    return str;
  });
  return result;
}

console.log(preservePunctuation(["shan't", "won't", "y'all'rn't", "fixin'", "'eard", "why??", "peter", "rabbit"])); // returns ["tnah's", "tno'w", "t'nrl'la'y", "nixif'", "'drae", "yhw??", "retep", "tibbar"]);
console.log(preservePunctuation([".?'"]));
