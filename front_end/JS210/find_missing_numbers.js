function missing(array) {
  let result = [];
  let start = array[0] + 1;
  let end = array[array.length - 1];

  for (let number = start; number < end; number++) {
    if (array.indexOf(number) === -1) {
      result.push(number);
    }
  }

  return result;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []

// New solution

function missing(array) {
  let result = [];

  for (let i = array[0]; i < array[array.length - 1]; i += 1) {
    if (!array.includes(i)) {
      result.push(i);
    }
  }
  return result;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []
