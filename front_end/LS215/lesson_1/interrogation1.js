// Write a function called myOwnEvery that is similar to 'every'.
// It takes an array and a function as arguments
// Returns true if every element passed to the function evals as truthy

function myOwnEvery(array, func) {
  for (let index = 0; index < array.length; index += 1) {
    if (!func(array[index])) return false;
  }
  return true;
}

let isAString = value => typeof value === 'string';
console.log(myOwnEvery(['a', 'a234', '1abc'], isAString)); // true
console.log(myOwnEvery(['cat', 73, 'dog'], isAString));
