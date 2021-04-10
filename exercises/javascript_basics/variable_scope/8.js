let a = 1;

function myFunction(a) {
  console.log(a);
}

let b = 2;

myFunction(b);

// Variable shadowing: The variable parameter 'a' on line 3 shadows the 'a' variable on line 1
// The 'a' we reference on line 3 refers to the argument passed in, which is 2
