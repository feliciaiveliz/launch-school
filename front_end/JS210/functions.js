// function average(a, b, c) {
//   return sum(a, b, c) / 3;
// }
//
// console.log(average(1, 2, 3));
//
// function sum(a, b, c) {
//   return a + b + c;
// }
//

// function average(array) {
//   let total = 0;
//   for (let index = 0; index < array.length; i += 1) {
//     total += array[i];
//   }
//   return total / array.length;
// }
//
// console.log(average([1, 2, 3, 4, 5]));

function average(array) {
  return sum(array) / array.length;
}
function sum(array) {
  let total = 0;
  for (let index = 0; index < array.length; index += 1) {
    total += array[index];
  }
  return total;
}

console.log(average([1, 2, 3, 4, 5]));

let temperatures = [32, 74, 58, 92, 49];
console.log(average(temperatures));
