/*
Your previous Markdown content is preserved below:

<!-- - assignments and comparison
- variable scope, especially how variables interact with function definitions and blocks
- function scope
- hoisting
- primitive values, types and type conversions/coercions
- object properties and mutation
- understand the differences between loose and strict equality
- how passing an argument into a function may or may not permanently change the value that a variable contains or points to
- working with Strings, Arrays, and Objects. In particular, you should be thoroughly familiar with the basic Array iteration methods (forEach, map, filter, and find) and how to use Object methods to access the keys and values in an Object as an Array.
- understand that arrays are objects, and be able to determine whether you have an Array
- variables as pointers
- console.log vs return
- truthiness: false and true vs. falsy and truthy
- function definition and function invocation
- function declarations, function expressions, and arrow functions
- implicit return value of function invocations
- first-class functions
- side-effects
- naming conventions (legal vs idiomatic)
- pure functions and side effects
- Closure
 -->

### Hoisting (not real)

<!-- - Syntax errors are detected during the creation phase, but before hoisting.
- Occurs during the creation phase; determines the scope for variable, function, and class declarations.
- JS hoists function declarations to the top of the scope, including the function body. Function declarations have `function` scope.
- Functions declarations are hoisted in the order which they appear.
- Function declarations with the same name are overridden with the "latest" declaration.
- Function declarations are always hoisted above variable declarations.
- If a function expression is assigned to a variable, then the variable declaration itself is hoisted but not the assignment of the variable to the function expression. They behave based on the variable declaration.
- Variable hoisting
    - `var` gets an initial value of `undefined` when hoisted.
      - hoisted to the top of the function (`var` has function scope)
    - `let` and `const` are hoisted, but not given an initial value.
      - hoisted to the top of the block (`let` and `const` have block scope)
 -->
*/

// Example 1
// What is output and how does JS see this code ?

        // a = 2;
        // var a;
        // console.log(a);


// a = 2;
// let a;
// console.log(a);

// creation phase (hoisted)
// var a; // implicit initialization (undefined)
// a = 2; // explicit assignment
// console.log(a);

// execution phase (ignore all declarations)
// a = 2;
// console.log(a);


// Example 2
// What is output and how does JS see this code ?
        // console.log(a);
        // var a = 2;

//
// var a; // a = undefined;
// console.log(a);
// a = 2;


// // Example 3
// // What is the output of this code ? Why ?

//         askQuestion();
//         let studentName = "Suzy";

//         function askQuestion() {
//             console.log(`${ studentName }, do you know?`);
//         }


// function askQuestion() {
//             console.log(`${ studentName }, do you know?`);
//   }

// let studentName; // not initialized, therefore not undefined

// askQuestion();
// studentName = "Suzy";

// // Example 4//
// // What is the output of this code and why ?
      foo();

      var foo;

      function foo() {
        console.log( 1 );
      }

      // function foo() {
      //   console.log( 2 );
      // }

// // After Hoisting

function foo() {
  console.log( 1 );
}

var foo;


console.log(typeof foo); // function

//   Example 5
//     What is the output of this code and why ?

//     foo = function() {
//       console.log( 2 );
//     };

//     function foo() {
//       console.log( 1 );
//     }

//     foo();

//     foo = function() {
//       console.log( 2 );
//     };


// // Example 6
// // What is the output of this code and why ?

//     greeting()

//       var greeting = function greeting() {
//           console.log("Hello!");
//       };

// // Example 7
// // What is the output of this code and why ?
//       console.log(studentName);

//       let studentName = "Suzy";

// // Bonus
// // What is the output of this code and why ?
//     foo();
//     function foo() {
//     console.log( 1 );
//     }

//     var foo = function() {
//     console.log( 2 );
//     };
//     function foo() {
//     console.log( 3 );
//     }


// 4. Written Assessment

//   Example 1

//   What does the following code output ? Explain in plain english why ?

//   [1,2,3].forEach(elem => console.log(elem));



//   Example 2

//   What does the following code return  ? Explain in plain english why ?

//   ['ant', 'bear'].map(elem => {
//     if (elem.length > 3) { return elem; }
//   });


//   Example 3

//   What does the following code output ? Explain in plain english why ?

//   let animal = "dog"

//   const speak = animal => {
//     if (animal === undefined) {
//       console.log("Bark")
//     } else {
//       console.log("Meow")
//     }
//   }

//   speak();
//   ```

//   Example 4

//   What does the following code return  ? Explain in plain english why ?

//   let greeting = ["Hello"];

//   function test(arr) {
//     arr = arr.concat("World!");
//     return arr;
//   }

//   test(greeting);
//  */
