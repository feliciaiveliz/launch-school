function repeatedCharacters(string) {
  let result = {};
  string = string.toLowerCase();

  for (let idx = 0; idx < string.length; idx++) {
    if (Object.keys(result).includes(string[idx])) {
      result[string[idx]] += 1;
    } else {
      result[string[idx]] = 1;
    }
  }

  for (let key in result) {
    if (result[key] === 1) {
      delete result[key];
    }
  }

  return result;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
