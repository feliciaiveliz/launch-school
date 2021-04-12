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
