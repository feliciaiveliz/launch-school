const readlineSync = require("readline-sync");

console.log('Please enter a phrase: ');
let result = readlineSync.prompt();

console.log(`There are ${result.replace(' ', '').length} characters in ${result}`.);
