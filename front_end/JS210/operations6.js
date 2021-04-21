function splice(array, start, values) {
  let result = [];

  for (let idx = start; idx <= values + 1; idx++) {
    result.push(array[idx]);
  }

  array.length = array.length - result;
  return result;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]
