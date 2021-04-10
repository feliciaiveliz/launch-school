function repeat(number, string) {
  counter = 0;

  while {
    string += string;
    counter += 1
  }

  return string
}

console.log(repeat(3, 'hi'));
