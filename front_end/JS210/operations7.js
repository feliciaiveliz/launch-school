function concat(a, b) {
  let result = [];

  for (let i = 0; i < a.length; i++) {
    result.push(a[i]);
  }

  for (let i = 0; i < b.length; i++) {
    result.push(b[i]);
  }

  return result;
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]

console.log([1, 2, 3].concat([4, 5, 6]));

// loop over the first array, adding each element to the new array
// loop over the second array, adding each element to the new array
