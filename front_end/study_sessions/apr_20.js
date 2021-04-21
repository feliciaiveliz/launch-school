
//EXERCISE 1 - Tyler
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
function sortArray(arr) {

  return;
}

const arr1 = [ 'seven', 'one', 'two', 'three', 'four', 'eight', 'five', 'ten' ];
const resultA = [ 'one', 'two', 'three', 'four', 'five', 'seven', 'eight', 'ten' ];
const resultB = resultA.slice().reverse();

const arr2 = [ 'seven', 'eight', 'two', 'three', 'four', 'eight', 'five', 'ten' ];
const resultC = [ 'two', 'three', 'four', 'five', 'seven', 'eight', 'eight', 'ten'];
const resultD = resultB.slice().reverse();

// JSON.stringify is a short cut for allowing comparison of the arrays
// these test are simply checking for the equality of elements in the arrays
// all test cases should result in 'true'
console.log(JSON.stringify(sortArray(arr1)) === JSON.stringify(resultA));
console.log(JSON.stringify(sortArray(arr1, true)) === JSON.stringify(resultB));
console.log(JSON.stringify(sortArray(arr2)) === JSON.stringify(resultC));
console.log(JSON.stringify(sortArray(arr2, true)) === JSON.stringify(resultD));





//EXERCISE 2 - Sam
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
function deepEquals(obj) {

  return;
}

const obj1 = { a: 'c', q: 2, z: 'the' };
const obj2 = { q: 2, a: 'c', z: 'the' };
console.log(deepEquals(obj1, obj2) === true);

const obj3 = { h: [1, 'l'], l: 2, p: 'the' };
const obj4 = { l: 2, h: [1, 'l'], p: 'the' };
Object.freeze(obj3);
Object.freeze(obj4);
console.log(deepEquals(obj3, obj4) === true);

const obj5 = { h: [ 1, 'l' ], l: 2, p: 'the' };
const obj6 = { l: 2, h: [ 1 ], p: 'the' };
Object.freeze(obj5);
Object.freeze(obj6);
console.log(deepEquals(obj5, obj6) === false);







//EXERCISE 3 - Sergio
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
function sortObject(obj) {

  return;}

const obj7 = { seven: 'one', two:'three', four:'eight', five: 'ten' };
const result7 = { one:'two', three:'four', five:'seven', eight:'ten' };
console.log(JSON.stringify(sortObject(obj7)) === JSON.stringify(result7));

const obj8 = { seven: 'eight', two:'three', four:'eight', five:'ten' };
const result8 = { two:'three', four:'five', seven:'eight', eight:'ten' };
console.log(JSON.stringify(sortObject(obj8)) === JSON.stringify(result8));








//EXERCISE 4 - Lawerence
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
function transformArray(arr) {

  return;
}

const arr3 = [ 'seven', 'one', 'two', 'three', 'four', 'eight', 'five', 'ten' ];
const resultE = [ 7, 1, 2, 3, 4, 8, 5, 10 ];

const arr4 = [ 7, 8, 2, 3, 4, 8, 5, 10 ];
const resultF = [ 'seven', 'eight', 'two', 'three', 'four', 'eight', 'five', 'ten' ];

// JSON.stringify is a short cut for allowing comparison of the arrays
// these test are simply checking for the equality of elements in the arrays
// all test cases should result in 'true'
console.log(JSON.stringify(transformArray(arr3)) === JSON.stringify(resultE));
console.log(JSON.stringify(transformArray(arr4)) === JSON.stringify(resultF));
