function mirroredArray(arr) {
  let reversedArray = arr.slice().reverse();
  return [arr, reversedArray].flat();
}

console.log(mirroredArray([1, 2, 3, 4, 5]));

function mirroredArray(arr) {
  return arr.concat(arr.slice().reverse());
}
