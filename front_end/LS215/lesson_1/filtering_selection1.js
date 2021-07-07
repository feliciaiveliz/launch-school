// Filtering is the process of creating a new array that contains a subset of an existing array

// let count = [1, 2, 3, 4, 5];
//
// let filtered = count.filter((number, index, array) => number % 2 === 0);
// console.log(filtered);

// filter takes a single argument, a callback function, that is applied to each element in an array

// Three arguments: current element in array, index of current element, the array object

// Only elements that return true from the callback function are put into the new array

function myFilter(array, func) {
  let result = [];

  array.forEach(value => {
    if (func(value)) {\
      result.push(value);
    }
  });

  return result;
}

let isPythagoreanTriple = function (triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
}

console.log(myFilter([{ a: 3, b: 4,  c: 5 },
          { a: 5, b: 12, c: 13 },
          { a: 1, b: 2,  c: 3 },], isPythagoreanTriple));
