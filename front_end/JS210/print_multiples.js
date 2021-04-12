function logMultiples(number) {
  for (let count = 99; count >= number; count -= 2) {
    if (count % number === 0) {
      console.log(count);
    }
  }
}

console.log(logMultiples(17));
