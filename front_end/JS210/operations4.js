let count = [1, 2, 3];

function shift(array) {
  let first = array[0];

  if (array.length === 0) {
    return undefined;
  }

  for (let idx = 0; idx < array.length - 1; idx++) {
    array[idx] = array[idx + 1];
  }

  array.length = array.length - 1;
  return first;
}

console.log(shift(count));
console.log(count);
