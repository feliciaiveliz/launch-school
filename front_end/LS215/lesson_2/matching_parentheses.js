// Write a function that takes a string as an argument and returns true if the string contains properly balanced parentheses, false otherwise. Parentheses are properly balanced only when '(' and ')' occur in matching pairs, with each pair starting with '('.

/*
input: string
output: boolean - true if string contains properly balanced ()
rules:
- parentheses are balanced if ( and ) occur in matching pairs
algorithm:
- declare variable 'count' to 0
- split string into characters and iterate
  - if character === (, add 1 to count
  - if character === ), subtract 1 from count
  - return false from loop if count is ever < 0
- return boolean based on if 'count' is === 0
*/

function isBalanced(string) {
  let count = 0;
  string = string.split('');

  for (let i = 0; i < string.length; i += 1) {
    if (string[i] === '(') {
      count += 1;
    } else if (string[i] === ')') {
      count -= 1;
    }
    if (count < 0) return false;
  }

  return count === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false
