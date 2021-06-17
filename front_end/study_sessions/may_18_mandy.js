function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
  }
}

myFunction();

// For the assessment, is it correct to refer to 'myFunction' as a 'function definition' or a 'function declaration'?

function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
    let a = 2;
    console.log(a);
  }
}

myFunction();

// How is the local variable 'a' on line 18 shadowing the local variable 'a' on line 14?

let a = 1;

function myFunction() {
  console.log(a);
}

myFunction();

// How do I explain defining a function?
// This code example logs 1 to the console and returns 'undefined'. On line 1 we declare and initialize a global variable 'a' and assign it to number 1. On lines 3-5 we define a function declaration called 'myFunction()'. Within the block created by the curly braces { }, we invoke 'console.log' on line 4 and pass in global variable 'a' to it as an argument. On line 7 we invoke the 'myFunction()' function definition (or declaration?) and 1 is logged to the console.

// This code example demonstrates that code within a block can access variables in an outer scope. The variable 'a' was declared in the outer global scope which means that it is accessible from anywhere in the program, including from within the body of 'myFunction()'.

let a = 1;

function myFunction(a) {
  console.log(a);
}

let b = 2;

myFunction(b);

// Ruby - In order for variable in the outer scope to be used within a method definition, you need to pass it in as a parameter/argument

a = 5

def a_method(b)
  puts b
end

a_method(a) -> 5

// let a = 'a';

// function func() {
//   let b = 'b'
//   function nestedFunc()  {
//     let c = 'c'
//     console.log(a, b, c);
//   }
//   nestedFunc();
// }

// func();


while (true) {
  a = 1
  console.log(a)
  break;
}

// console.log(a)
/*
JS uses lexical scoping, this means that the structure of the code determines a variable's scope. Every function declaration and every block creates a new local variable scope. The function or block that is created does not have to be executed for the local scope to exist. The structure of the code creates a hierarchy of scopes from local scope to the program's global scope. When JS tries to find a variable, it searches the hiearchy of scopes from bottom to top. JS will search for a variable in the surrounding scope, if JS cannot find the variable, then JS will look in the outer scopes until JS encounters the first variable with a matching name and will stop. If JS doesn't find a matching variable, it creates a new global variable.
*/

function randomFunction() {
  let greeting = 'Hello, good morning!';

  return function() {
    return console.log(greeting);
  }
}

let sentence = randomFunction();
sentence();

let a = 'a';

function func() {
  let b = 'b'
  function nestedFunc()  {
    let c = 'c'
    console.log(a, b, c); // logs a b c
  }
  nestedFunc();
}

func();

let key = 'employed'

let myObject = {
  name: 'Billy',
  age: 30,
  employed: true,
  married: false,
}

console.log(myObject['name']);

// myObject[name]
// myObject['Ashley']
// myObject.Ashley

// console.log(myObject.name)
