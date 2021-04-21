function lastNOf(arr, count) {
  return arr.slice(count, arr.length);

  // or

  return arr.slice(arr.length - count);
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));
