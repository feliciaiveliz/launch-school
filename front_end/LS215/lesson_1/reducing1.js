// function add(previousValue, element) {
//   let sum = previousValue + element;
//   console.log(previousValue, element, sum);
//   return sum;
// }
//
// let count = [1, 2, 3, 4, 5];
// console.log(count.reduce(add));

// Four arguments are passed to reduce: 'accumulator' -> return value of previous callback invocation
// current element in array
// current index of current element
// array

function myReduce(array, func, initial) {
  let value;
  let index;

  if (initial === undefined) {
    value = array[0];
    index = 1;
  } else {
    value = initial;
    index = 0;
  }

  array.slice(index).forEach(element => value = func(value, element));
  return value;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));
