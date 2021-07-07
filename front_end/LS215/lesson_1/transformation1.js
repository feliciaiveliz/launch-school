let count = [1, 2, 3, 4, 5];
let doubled = count.map((number, index, array) => number * 2);
console.log(doubled);

// Transforamtion returns a new array populated with the return value of a transformation that is applied to each element in an array by a callback function.

// Three arguments: value of the current element, index of the current element, array to be processed

function myMap(array, func) {
  let result = [];

  array.forEach(element => result.push(func(element)));

  return result;
}

let plusOne = n => n + 1;
console.log(myMap([1, 2, 3, 4], plusOne)); // [2, 3, 4, 5]
