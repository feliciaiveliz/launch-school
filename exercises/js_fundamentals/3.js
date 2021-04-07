var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

// This is local

// We are only declaring one variable on line 1
// Within the function, we reassign the value of myVar to a different string
// Globally scoped variables can be accessed from within function scope
