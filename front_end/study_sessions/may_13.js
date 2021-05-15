// [[1, 2], [3, 4]].map(arr => {
//   return arr.map(num => num * 2);
// });

// This code will return [[2, 4], [6, 8]] and is a new array. The map iterates over an array and each new
// element is the return value of invoking the callback function on the element. For each element in arr,
// The `{ return arr.map(num => num * 2); });` multiplies it by 2 and inserts that new number into a new array.
// At the end of iteration, this new array is returned with all the numbers in the original array multiplied by 2.

// let array1 = [1, 2, undefined, 4];
// console.log(array1.length); // 4
//
// let array2 = [1];
// array2.length = 5;
// console.log(array2.length); // 5
//
// let array3 = [];
// array3[-1] = [1];
// console.log(array3.length); // 0
//
// let array4 = [1, 2, 3, 4, 5];
// array4.length = 3;
// console.log(array4.length); // 3
//
// let array5 = [];
// array5[100] = 3;
// console.log(array5.length); // 101
//
// array1 has a length of 4 because it contains 4 elements. undefined is considered

// > let c = [1, 2]
// > let d = c
// > c = [3, 4]
// > c
// = [3, 4]
// > d
// = [1, 2]
//
// The global variable 'c' now points to [3, 4] while 'd' points to [1, 2]. Reassignment does not have an effect on the values
// that other variables are pointing to. At first, 'c' and 'd' are referencing an array of the same value, [1, 2] but reassigning
// 'c' to [3, 4] only changes the binding between 'c' and its original value, but not 'd' and what it's referencing.

let array = [1, 2, 3];
let newArr = array.forEach(function (num) {
  return num;
});
console.log(newArr);
