// What does this program log to the console? Why?

let foo = 'bar';
{
  let foo = 'qux';
}

console.log(foo);

// The program outputs 'bar'
// We declare and initialize a variable named 'foo' with the value of 'bar'
// We start a new block on line 2 with '{}', and end up creating a new variable named 'foo' that shadows the 'foo' variable
// on line 1
