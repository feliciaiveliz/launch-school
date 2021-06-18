// const myObject = {
//   prop1: '123',
//   prop2: '234',
//   'prop3': '345',
// };
//
// const prop2 = '456';
// myObject['prop2'] = '456';
// myObject[prop2] = '678';
//
// console.log(myObject[prop2]); // '678'
// // -> prop2 is a variable. Line 9 takes the value of the variable, sets it as a key, and then sets the value as '678'
//
// console.log(myObject);
// // { '456': '678', prop1: '123', prop2: '456', prop3: '345' }
//
// console.log(myObject.prop2); // '456'
// // -> Dot notation is used to access a value in an object. This is saying, myObject.'prop2', which is the 3rd key in the myObject
// // The value of 'prop2' was previously '234' and is now reassigned to ''456'

const myObj = {};
myObj[myFunc()] = 'hello, ';

function myFunc() {
  return 'funcProp';
}

console.log(myObj);
myObj[myFunc()] = 'world!';
console.log(myObj);

// The function myFunc() is hoisted to the top of the program.
// The key myFunc() has a value of 'hello, '
// The key myFunc() is then reassigned to have a value of 'world!'
