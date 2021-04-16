const readlineSync = require("readline-sync");

console.log('Please enter a phrase: ');
let result = readlineSync.prompt();

result = result.replace(' ', '');
console.log(`There are ${result.length} characters in ${result}.`);
