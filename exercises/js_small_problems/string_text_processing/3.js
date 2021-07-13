// Write a function that takes a string and returns an object containing three properties: one representing the number of characters in the string that are lowercase letters, one representing the number of characters that are uppercase letters, and one representing the number of characters that are neither.
//

/*
input: array of characters that are letters, numbers and anything else
output: object with 3 properties, counts of upper/lower letters, and neither characters
rules:
- lowercase property is first
- uppercase property is second
- neither property is last
algorithm:
- declare 'result' to { lowercase: 0, uppercase: 0, neither: 0 }
- iterate over string, given character:
  - use regex:
    - if lower letter, update result (lowercase) by 1
    - if upper letter, update result (uppercase) by 1
    - if neither, update result (neither) by 1
- return result
*/

function letterCaseCount(string) {
  let result = { lowercase: 0, uppercase: 0, neither: 0 };
  for (let i = 0; i < string.length; i += 1) {
    let letter = string[i];

    if (/[a-z]/.test(letter)) {
      result.lowercase += 1;
    } else if (/[A-Z]/.test(letter)) {
      result.uppercase += 1;
    } else {
      result.neither += 1;
    }
  }

  return result;
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }
