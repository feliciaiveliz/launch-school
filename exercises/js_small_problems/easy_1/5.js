let rlSync = require('readline-sync');
let number = rlSync.question("Please enter an integer greater than 0: ");
let choice = rlSync.question("Enter 's' to compute the sum, or 'p' to compute the product. ");
number = Number(number);

function computeSum(number) {
  let result = 0;

  for (let i = 0; i <= number; i += 1) {
    result += i;
  }

  console.log(`The sum of the integers between 1 and ${number} is ${result}.`);
}

function computeProduct(number) {
  let result = 1;

  for (let i = 1; i <= number; i += 1) {
    result *= i;
  }

  console.log(`The product of the integers between 1 and ${number} is ${result}.`);
}

if (choice === 's') {
  return computeSum(number);
} else {
  return computeProduct(number);
}
