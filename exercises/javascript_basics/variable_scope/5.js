function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
    let a = 2;
    console.log(a);
  }
}

myFunction();

// The variable declared on line 6 is shadowing the variable 'a' on line 2
// This variable a's scope is the whole block, and we can't output the code on
// line 5 because the variable 'a' on line 2 is hidden
