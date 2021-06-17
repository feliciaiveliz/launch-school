function invoiceTotal(...args) {
  let result = 0

  for (let i = 0; i < args.length; i += 1) {
    result += args[i];
  }

  return result;
}

console.log(invoiceTotal(20, 30, 40, 50));          // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40));  // does not work; how can you make it work?
