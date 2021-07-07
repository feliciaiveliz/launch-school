// Write a function that takes an array of numbers and returns the sum of the sums of each leading subsequence in that array. Examine the examples to see what we mean. You may assume that the array always contains at least one number.

/*
input: array that contains at least one number
output: number
rules:
- number is the sum of the sums of each leading subsequence in the array
algorithm:
- declare 'currentNumber' to 0;
- declare 'result' to 0;
- iterate over array using 'forEach':
  - 'currentNumber' += 'number'
  - result += currentNumber
- return 'result'
*/

function sumOfSums(array) {
  let result = 0;
  let currentNumber = 0;

  array.forEach(number => {
    currentNumber += number;
    result += currentNumber;
  });

  return result;
}

console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
