let vocabulary = [
  ['happy', 'cheerful', 'merry', 'glad'],
  ['tired', 'sleepy', 'fatigued', 'drained'],
  ['excited', 'eager', 'enthused', 'animated']
];

for (let vocabIdx = 0; vocabIdx < vocabulary.length; vocabIdx++) {
  let words = vocabulary[vocabIdx];

  for (let wordIdx = 0; wordIdx < words.length; wordIdx++) {
    console.log(words[wordIdx]);
  }
}

// My solution

for (let i = 0; i < vocabulary.length; i += 1) {
  for (let j = 0; j <= vocabulary[i].length; j += 1) {
    console.log(vocabulary[i][j]);
  }
}
