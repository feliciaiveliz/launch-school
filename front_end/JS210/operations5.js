function splice(array, startIdx, count) {
  let result = [];

  for (let idx = startIdx; idx <= count; idx += 1) {
    result.push(array[idx]);
  }

  return array - result;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));
console.log(count);
