var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();

// This is global

// JS looks for the myVar variable in its current scope, which is the local scope of the function.
// but cannot find it, therefore it needs to look in the outer scope. It finds it and outputs its value
