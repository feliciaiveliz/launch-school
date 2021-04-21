let count = [1, 2, 3];

let unshift = function(array, value) {
  for (let index = array.length; index > 0; index -= 1) {
    array[index] = array[index - 1];
  }

  array[0] = value;
  return array.length;
}

console.log(unshift(count, 0));
console.log(count);

// unshift mutates the original array
