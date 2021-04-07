var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();

// This is local

// The console.log(myVar) expression is insde the function
// JS gives priority to the variable in the local scope with respect to the function
// Since the variable within the function has the same name as the one in the outer scope, the outer scoped variable is shadowed
