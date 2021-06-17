function uniqueElements(array) {
  let result = [];

  for (let idx = 0; idx < array.length; idx++) {
    if (!result.includes(array[idx])) {
      result.push(array[idx]);
    }
  }

  return result;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));

// iterate over array
// save first element to array
// add that element to new array
// on the next element, if it is different that the currently saved number,
// save the new number and push it into the array
// if the number is the same, skip past it to the next number
// return result

function uniqueElements(array) {
  let result = [];

  for (let i = 0; i < array.length; i += 1) {
    if (result.includes(array[i])) {
      continue;
    }
    result.push(array[i]);
  }
  return result;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));
