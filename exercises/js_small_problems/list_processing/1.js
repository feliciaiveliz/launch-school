function sum(number) {
  numbers = String(number).split('');
  return numbers.reduce((sum, value) => sum + Number(value), 0);
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45
