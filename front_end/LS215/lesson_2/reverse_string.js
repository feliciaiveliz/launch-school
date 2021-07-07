// Implement a function that takes a string as an argument and returns a new string that contains the original string in reverse.
//

/*
input: string
output: new reversed string
algorithm:
- declare 'result' to ''
- make a copy of input string using slice(), save to 'result'
- call reverse() on 'result'
- return 'result';
*/

function reverse(string) {
  return string.split('').reverse().join('');
}

console.log(reverse('hello'));                  // returns "olleh"
console.log(reverse('The quick brown fox'));    // returns "xof nworb kciuq ehT"
