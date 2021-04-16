function toLowerCase(string) {
  let lowercasedString = '';

  for (let i = 0; i < string.length; i++) {
    let charCode = string.charCodeAt(i);

    if (string[i] >= 'A' && string[i] <= 'Z') {
      charCode += 32;
    }

    lowercasedString += String.fromCharCode(charCode);
  }
  return lowercasedString
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"
