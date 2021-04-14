function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log('ERROR: No delimiter');
    return;
  }

  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    if (string[i] === delimiter) {
      console.log(result);
      result = '';
    } else if (delimiter === '') {
      console.log(string[i]);
    } else {
      result += string[i];
    }
  }

  if (result) {
    console.log(result);
  }
}

console.log(splitString('abc,123,hello world', ','));
console.log(splitString('hello'));
console.log(splitString('hello', ''));
console.log(splitString('hello', ';'));
console.log(splitString(';hello;', ';'));
