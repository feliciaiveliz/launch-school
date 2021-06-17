// const multiply = function(a, b) {
//   return a * b;
// };
//
// const multiply = (a, b) => {
//   return a * b;
// };
//
// const multiply = (a, b) => return a * b;
//
// const multiply = (a, b) => a * b;

// [2, 4, 6].forEach(number => console.log(number));
//
// [2, 4, 6].forEach(function (number) {
//   console.log(number);
// });
//
// [2, 4, 6].forEach((number) => console.log(number));

// let animals = {
//   a: 'bird',
//   b: 'cat',
//   c: 'dog',
// }
//
// for (const property in animals) {
//   console.log(`${property}: ${animals[property]}`);
// }

// forEach accepts a function that is applied to each property of an array object
// delete myArray[1] -> i am deleting the element in myArray sub1

// the === operator compares object references, not values in the case of objects
// the === operator compares values and same types when it comes to primitives

// console.log(foo);
//
// let foo;
// foo = 4;

// Function declarations
//
//         |
// Variable declarations       (var a;) -> undefined
//
//         |
// Function/method invocations (console.log(a);)
//
//         |
// Variable initializations    (a = 2)
//

// console.log([4, 3, 5, 2, 1].sort((a, b) => a - b));

// let a = [1, 2, 3];
// let b = a;
// a.pop();
// console.log(a);
// console.log(b);

// let a;
// a = 5;
//
// console.log(a);

// let randomNumber;
// console.log(randonNumber);

// What will each of the following expressions return?
(false && undefined); //
(false || undefined); //
((false && undefined) || (false || undefined)); //
((false && undefined) || 'a' || ''); //
((false || undefined) || (false && undefined)); //
('a' || (false && undefined) || ''); //
((false || undefined) && 'a' && ''); //
((false && undefined) && (false || undefined)); //
('a' && (false || undefined) && ''); //
((false || undefined) && (false && undefined)); //
