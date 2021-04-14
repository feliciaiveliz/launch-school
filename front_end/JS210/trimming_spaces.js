function trim(string) {
  let trimmed = trimLeft(string);
  trimmed = trimRight(trimmed);

  return trimmed;
}

function trimLeft(string) {
  let copyMode = false;
  let result = '';

  for (let i = 0; i < string.length; i++) {
    if (string[i] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      result += string[i];
    }
  }

  return result;
}

function trimRight(string) {
  let copyMode = false;
  result = '';

  for (let i = string.length - 1; i >= 0; i -= 1) {
    if (string[i] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      result = string[i] + result;
    }
  }

  return result;
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""
