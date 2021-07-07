// Take a list of words as an argumnet and return the word with the most characters

function myReduce(array, func, initial) {
  let value;
  let index;

  if (initial === undefined) {
    value = array[0];
    index = 1;
  } else {
    value = initial;
    index = 0;
  }

  array.slice(index).forEach(element => value = func(value, element));
  return value;
}

// or

function longestWord(words) {
  return myReduce(words, function (result, currentWord) {
    return currentWord.length >= result.length ? currentWord : result;
  });
}

function longestWord(words) {
  return myReduce(words, longest);
}

function longest(result, currentWord) {
  return currentWord.length >= result.length ? currentWord : result;
}

console.log(['abc', 'launch', 'targets', '']);
