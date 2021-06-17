function sortDescending(arr) {
  let sortedArray = arr.slice().sort((a, b) => a - b).reverse();
  return sortedArray;
}

function sortDescending(arr) {
  let arrCopy = arr.slice();
  return arrCopy.sort((a, b) => b - a);
}

let array = [23, 4, 16, 42, 8, 15];
let result = sortDescending(array);  // returns [42, 23, 16, 15, 8, 4]
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]

// New solution

function sortDescending(array) {
  let arrayCopy = array.slice(0);
  return arrayCopy.sort((a, b) => (b - a));
}

let array = [23, 4, 16, 42, 8, 15];
let result = sortDescending(array);  // returns [42, 23, 16, 15, 8, 4]
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]
