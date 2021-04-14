function gcd(num1, num2) {
  var number;

  while (num2 !== 0) {
    number = num2;
    num2 = num1 % num2;
    num1 = number;
  }

  return num1;
}

console.log(gcd(12, 4));
console.log(gcd(15, 10));
console.log(gcd(9, 2));
