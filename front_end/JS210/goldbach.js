/*
input: number
output: two numbers
rules:
- the numbers must be prime
- prime means that the number is divisible by only 1 and itself
- the numbers must add up to equal the argument numbers
- log the pairs with the smallest number first
- if the argument is odd or < 4, log null
- use isPrime function
algorithm:
- use a nested loop to get all pairs of numbers from 2 to 'expectedSum'
-
*/

function isPrime(number) {
  if (number <= 1) {
    return false;
  }

  for (let divisor = 2; divisor < number; divisor++) {
    if (number % divisor === 0) {
      return false;
    }
  }
  return true;
}

function checkGoldbach(expectedSum) {
  if (expectedSum % 2 === 1 || expectedSum < 4) {
    console.log(null);
    return;
  }

  for (let firstNum = 2; firstNum < expectedSum; firstNum++) {
    let secondNum = expectedSum - firstNum;

    if (firstNum > secondNum) {
      break;
    }

    if ((isPrime(secondNum)) && (isPrime(firstNum))) {
      if (firstNum > secondNum) {
        console.log(secondNum, firstNum);
      } else {
        console.log(firstNum, secondNum);
      }
    }
  }
}

console.log(checkGoldbach(3));
// logs: null

console.log(checkGoldbach(4));
// logs: 2 2

console.log(checkGoldbach(12));
// logs: 5 7

console.log(checkGoldbach(100));
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53
