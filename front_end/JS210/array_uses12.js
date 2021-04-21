function matrixSums(arr) {
  let result = [];
  let outerLength = arr.length;

  for (let outerIndex = 0; outerIndex < outerLength; outerIndex++) {
    let sum = 0;
    let innerLength = arr[outerIndex].length;

    for (let innerIndex = 0; innerIndex < innerLength; innerIndex++) {
      sum += arr[outerIndex][innerIndex];
    }

    result.push(sum);
  }

  return result;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]
