let a = 5;
let b = false;

if (a > 4) {
  let b = true;
}

console.log(b);

// We declare and initialize the variable 'b' on line 2 and assign it to false
// This is a different variable 'b' than the one on line 5
// That variable 'b' on line 5 is within a block scope and is therefore not accessible outside of the block to be output
