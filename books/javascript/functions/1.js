// What does this code log to the console? Does executing the foo function affect the output? Why or why not?

let bar = 1;
function foo() {
  let bar = 2;
}

foo();
console.log(bar); // 1

// JS functions create an inner scope
// The 'bar' variable on line 5 is not the same variable as on line 3
// 'foo()' has no effect on the final output

let bar = 1;
function foo() {
  bar = 2;
}

foo();
console.log(bar); // 2

// Here, 'bar' variable from line 1 is in scope for it to be reassigned within the method
