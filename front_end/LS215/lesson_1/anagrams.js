// Write a Function named anagram that takes two arguments: a word and an array of words. Your function should return an array that contains all the words from the array argument that are anagrams of the word argument. For example, given the word "listen" and an array of candidate words like "enlist", "google", "inlets", and "banana", the program should return an array that contains "enlist" and "inlets".
//

/*
input: string word, array of string words
output: array of string words that are anagrams of first argument
rules:
- anagrams are words that contain the same letters and are of the same length as another word
algorithm:
- call filter() on list:
  - select word if word length is equal to word argument
  - sort both words and check if they are equal
- return array
*/

function areAnagrams(wordToCheck, sourceWord) {
  if (wordToCheck.length !== sourceWord.length) return false;

  wordToCheck = wordToCheck.split('').sort();
  sourceWord = sourceWord.split('').sort();

  for (let i = 0; i < sourceWord.length; i += 1) {
    if (sourceWord[i] !== wordToCheck[i]) return false;
  }
  return true;
}

function anagram(word, list) {
  return list.filter(candidate => areAnagrams(candidate, word));
}

// or

function areAnagrams(wordToCheck, sourceWord) {
  if (wordToCheck.length !== sourceWord.length) return false;

  wordToCheck = wordToCheck.split('').sort();
  sourceWord = sourceWord.split('').sort();

  return array1.every((letter, index) => letter === array2[index]);
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
