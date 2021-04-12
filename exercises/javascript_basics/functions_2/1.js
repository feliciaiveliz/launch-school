// function greet(greeting) {
//   console.log(greeting + ', world!');
// }
//
// console.log(greet('Salutations'));
// console.log(greet());

function greet(greeting = 'Hello') {
  console.log(greeting + ', world!');
}

console.log(greet('Salutations'));
console.log(greet(undefined));
