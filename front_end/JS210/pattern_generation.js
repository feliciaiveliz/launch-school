/*
input: number > 1 and < 10
output: log a square, with numbers and stars '*'
rules:
- start at 1
- end at 'n'
- create a counter, counter = 'n'
- for each line, log number + (n - 1)
- increment counter by 1 each time until 0
algorithm:
- create function generatePattern(number)
- 'while' loop until counter < 1:
  - declare/init variable 'counter' = 'number'
  - console.log(number + (number - counter * '*'))
  - increment counter++
- return;
*/

function generatePattern(number) {
  for (let lineNumber = 1; lineNumber <= number; lineNumber++) {
    let string = '';

    for (let digit = 1; digit <= lineNumber; digit += 1) {
      string += String(digit);
    }

    for (let count = lineNumber + 1; count <= number; count++) {
      string += '*';
    }

    console.log(string);
  }
}

console.log(generatePattern(7));
