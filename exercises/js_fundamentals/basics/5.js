const readlineSync = require("readline-sync");

console.log('Enter the first number: ');
let answer1 = Number(readlineSync.prompt());

console.log('Enter the second number: ');
let answer2 = Number(readlineSync.prompt());

let sum = answer1 + answer2;
let difference = answer1 - answer2;
let product = answer1 * answer2;
let quotient = answer1 / answer2;
let remainder = answer1 % answer2;
let power = answer1 ** answer2;

console.log(`${answer1} + ${answer2} = ${sum}`);
console.log(`${answer1} - ${answer2} = ${difference}`);
console.log(`${answer1} * ${answer2} = ${product}`);
console.log(`${answer1} / ${answer2} = ${remainder}`);
console.log(`${answer1} ** ${answer2} = ${power}`);
