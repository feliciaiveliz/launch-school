const a = 1;

function myFunction() {
  a = 2;
}

myFunction(a);

// const variables are block-scoped like 'let' variables but you can't reassign it
// 'a' argument is ignored because the function doesn't take parameters
