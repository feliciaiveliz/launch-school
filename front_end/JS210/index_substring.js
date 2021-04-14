/*
input: two strings
output: number, index of substr
rules:
- 'indexOf' returns index of substr where it 'starts'
- 'LastIndexOf' returns index of substr where it 'ends'
- if there are no substrings, return -1
algorithm:
- split firstString into an array of chars
  - iterate:
    - compare the first letter in firstString to secondString[0]
    - if the same, slice out substring from firstString, save it to 'substring'
      - declare variable 'substring' = []
      - substring = firstString.slice((current char), (secondString.length - 1))
      - if substring === secondString, return index of the first character that starts the substring
  - return -1
- end
*/

function indexOf(firstString, secondString) {
  let firstStr = firstString.split('');

  for (let index = 0; index <= firstStr.length; index++) {
    if (firstStr[index] === secondString[0]) {
      var substring = [];
      substring = firstStr.slice(index).join('');
      if (substring === secondString) {
        return firstStr.indexOf(firstStr[index]);
      }
    }
  }
  return -1;
}

function lastIndexOf(firstString, secondString) {
  let limit = firstString.length - secondString.length;

  for (let firstIndex = limit; firstIndex >= 0; firstIndex -= 1) {
    let countMatch = 0;

    for (let secondIndex = 0; secondIndex < secondString.length; secondIndex++) {
      if (firstString[firstIndex + secondIndex] === secondString[secondIndex]) {
        countMatch += 1;
      } else {
        break;
      }
    }

    if (countMatch === secondString.length) {
      return firstIndex;
    }
  }

  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
