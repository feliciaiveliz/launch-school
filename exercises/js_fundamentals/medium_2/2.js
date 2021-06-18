// const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };
//
// console.log(person === otherPerson);    // false -- expected: true

// This code will log false because '===' compares objects and arrays to see if they are the same object (or array).
// Unless it's two variables pointing to the same object (or array) in memory, they will be different objects.
// A reference to the object is stored in a variable, so when another variable is assigned to a variable that references an object, that new variable will receive a copy of the pointer to the value of the object in memory space.
const person = { name: 'Victor' };
const otherPerson = person;

console.log(person === otherPerson);    // false -- expected: true
