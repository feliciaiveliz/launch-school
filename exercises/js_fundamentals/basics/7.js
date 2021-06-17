function stringToInteger(string) {
  let result = 0;
  string = string.split('');

  for (let i = 0; i < string.length; i++) {
    result += Number(string[i]);
  }

  return result;
}

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570

const DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
};

function stringToInteger(string) {
  let value = 0;
  const numbers = stringToNumbers(string);

  for (let i = 0; i < numbers.length; i += 1) {
    value = 10 * value + numbers[i];
  }

  return value;
}

function stringToNumbers(string) {
  const result = [];

  for (let i = 0; i < string.length; i += 1) {
    result.push(DIGITS[string[i]]);
  }

  return result;
}
