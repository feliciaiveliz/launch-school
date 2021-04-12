function repeat(number, string) {
  result = ''

  while (number > 0) {
    result += string;
    number -= 1;
  }

  return result;
}

console.log(repeat(3, 'ha'));
