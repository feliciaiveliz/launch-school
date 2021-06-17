function mirroredArray(arr) {
  let reversedArray = arr.slice().reverse();
  return [arr, reversedArray].flat();
}

console.log(mirroredArray([1, 2, 3, 4, 5]));

function mirroredArray(arr) {
  return arr.concat(arr.slice().reverse());
}

function mirroredArray(array) {
  let result = array;
  length = result.length - 1;

  for (let i = length; i >= 0; i -=1 ) {
    result.push(result[i]);
  }

  return result;
}

console.log(mirroredArray([1, 2, 3, 4, 5]));
