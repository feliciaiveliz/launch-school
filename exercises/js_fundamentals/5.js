function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);

// This is global

// The myVar variable is not declared anywhere in the outer global scope, so JS looks for it in the function,
// and finds it there. Since it is not declared, JS binds it to be a property of the global object.
