function wordCount(string) {
  string = string.split(' ');
  let result = {};

  for (idx = 0; idx < string.length; idx++) {
    if (Object.keys(result).includes(string[idx])) {
      result[string[idx]] += 1;
    } else {
      result[string[idx]] = 1;
    }
  }

  return result;
}

console.log(wordCount('box car cat bag box'));
