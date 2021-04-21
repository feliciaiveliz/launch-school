function oddElementsOf(arr) {
  let result = [];

  for (let i = 0; i < arr.length; i++) {
    if (i % 2 === 1) {
      result.push(arr[i]);
    }
  }

  return result;
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits));
