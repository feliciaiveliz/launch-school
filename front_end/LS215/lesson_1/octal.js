// Write a Function named octalToDecimal that performs octal to decimal conversion. When invoked on a String that contains the representation of an octal number, the Function returns a decimal version of that value as a Number. Implement the conversion yourself: do not use something else to perform the conversion for you.
//

/*
input: string that represents a Number
output: number that is a decimal
rules:
- start with 0 and count up for each individual Number
- multiply each number by (8^(current number))
  - using an index at 0 might be easier
- add all numbers together once they've been mulitiplied by powers of 8
algorith:
- convert string into array of numbers:
  - call split('') to convert to array of strings
  - call map on that return value to convert strings to numbers using Number()
- declare decimal variable to 0;
- with array of numbers:
  - for loop:
    - iterate backwards starting at last index in array and work forwards
    - for each number, multiply: (n*(8**index));
    - assign to 'decimal' variable
- return 'decimal'
*/

function octalToDecimal(numberString) {
  arrayOfNumbers = numberString.split('').map(n => Number(n));
  let decimal = 0;
  for (let i = arrayOfNumbers.length - 1; i >= 0; i -= 1) {
    let index = 0;
    decimal += (arrayOfNumbers[i] * (8 ^ index));
    index += 1;
  }
  return decimal;
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
