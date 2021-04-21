function slice(array, start, end) {
  result = [];

  for (let idx = start; idx < end; idx++) {
    result.push(array[idx]);
  }

  return result;
}

console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]
