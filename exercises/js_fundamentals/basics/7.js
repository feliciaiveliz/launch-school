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
