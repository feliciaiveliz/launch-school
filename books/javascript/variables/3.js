// What happens when you run the following program? Why do we get that result?

{
  let foo = 'bar';
}

console.log(foo);

// let creates variables with block scope, which limits the visibility of the variable to the block
