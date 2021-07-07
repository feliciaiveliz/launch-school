// Write a function that takes two array arguments, each containing a list of numbers, and returns a new array containing the products of all combinations of number pairs that exist between the two arrays. The returned array should be sorted in ascending numerical order.

/*
input: two arrays of numbers
output: new array of numbers that are products of all combinations of numbers from both arrays
algorithm:
- declare and initialize result = []
- iterate over the length of array1 with 'for' loop:
    - iterate over length of array2 with 'for' loop:
    - multiply currentNumber * array2[index]
    - push product into 'result'
  - repeat for length of array2
  - repeat:
    - iterate over length of array2 with 'for' loop:
    - multiply currentNumber * array2[index]
    - push product into 'result'
- sort result in acsending order using 'sort'
*/

function multiplyAllPairs(array1, array2) {
  result = [];

  for (let i = 0; i < array1.length; i += 1) {
    for (let j = 0; j < array2.length; j += 1) {
      result.push(array1[i] * array2[j]); // [8]
    }
  }
  return result.sort((a, b) => a - b);
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16])
