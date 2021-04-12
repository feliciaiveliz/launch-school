// function logOddNumbers(number) {
//   num = 1;
//
//   while (num <= number) {
//     console.log(num);
//     num += 2;
//   }
// }

// or

// function logOddNumbers(number) {
//   for (let counter = 1; counter <= number; counter += 2) {
//     console.log(counter);
//   }
// }

// or

function logOddNumbers(number) {
  for (let counter = 1; counter <= number; counter++) {
    if (counter % 2 === 1) {
      console.log(counter);
    }
  }
}

console.log(logOddNumbers(19));
