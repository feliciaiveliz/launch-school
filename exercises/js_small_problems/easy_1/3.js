let question = require('readline-sync');

console.log("What measurement would you like to use, feet or meters?")
let input = question.prompt();

console.log(`Enter the length of the room in ${input}:`);
let length = question.prompt();
length = Number(length, 10);

console.log(`Enter the width of the room in ${input}:`);
let width = question.prompt();
width = Number(width, 10);

let area = length * width;
let feet = area * 10.7639;
let meters = area * 0.3048;

if (input === 'meters') {
  console.log(`The area of the room is ${area} square meters (${feet} square feet).`);
} else {
  console.log(`The area of the room is ${area} square feet (${meters.toFixed(2)} square meters).`);
}
