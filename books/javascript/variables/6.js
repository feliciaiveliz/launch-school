// Will this program produce an error when run? Why or why not?
const FOO = 'bar';
{
  const FOO = 'qux';
}

console.log(FOO);

// There is no error message, and it outputs 'bar'
// The {} on line 2 creates a block and therefore a new scope, allowing us to output its value
