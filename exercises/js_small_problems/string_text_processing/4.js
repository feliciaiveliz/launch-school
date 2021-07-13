// Write a function that takes a string as an argument and returns that string with the first character of every word capitalized and all subsequent characters in lowercase.
//
// // You may assume that a word is any sequence of non-whitespace characters.

/*
input: string of words sepeterated by spaces
output: same string with each word capitalized
rules:
- all letters after the first letter are lowercased
- a word is any sequence of non-whitespace characters
algorithm:
- iterate over string of words
  - uppercase first letter and downcase rest of letters
- join array with empty spaces
- return string
*/

function wordCap(string) {
  return string.split(' ').map(word => word[0].toUpperCase() + word.slice(1).toLowerCase()).join(' ');
}

console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'
