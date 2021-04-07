var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

// This is global

// JS uses lexical scope. The structure of the program determines
// the scope of a variable. the myVar variable was declared in the
// global scope and is a different variable than the myVar one inside
// someFunction function.
