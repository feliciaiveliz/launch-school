// Explain why this code logs '510' instead of 15.

console.log('5' + 10);

// Javascript implicitly coerces the integer 10 into a string, '10'. This string is then concatenated to the string '5', which results in '510'.
