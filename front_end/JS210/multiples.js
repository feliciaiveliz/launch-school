/*
input: none
output: odd string numbers from 1 to 100 that are multiples of 3 and 5
*/

function multiplesOfThreeAndFive() {
  for (let number = 1; number <= 100; number++) {
    if ((number % 3 === 0) && (number % 5 === 0)) {
      console.log(String(number) + '!');
    } else if ((number % 3 === 0) || (number % 5 === 0)) {
      console.log(String(number));
    }
  }
}

console.log(multiplesOfThreeAndFive());
