/*

1. Introductions
2. Questions
3. Hoisting

  What happens before JS engine executes code ?
  - The creation is the first phase that occurs before the creation phase. This is where syntax errors are caught and where hoisting occurs.
  -
  What is hoisting ?
  - Hoisting is a behavior that 'hoists' variable and function declarations to the top of their current scope.
  - It parses code by splitting it into chunks of variables, functions, etc.

  Does JS re-arrange the code in hoisting ?
  - Code is not actually moved. It is just a mental model or visual way to think about what is happening.

  When does hoisting occur ?
  - It occurs during the creation phase.

  What are the rules of hoisting ?
  - 'var' variables are hoisted to the top of the scope and are assigned to 'undefined'.

  What is different about function hoisting and variable hoisting ?
  - Function declarations in their entirety are hoisted to the top of the global scope.
  - Function expressions are not hoisted at all.
  - Variables are hoisted but it is different for each variable type declaration

  What is the difference between hoisting in functions and function expressions ?
  - Function declarations are hoisted in entirety above variable declarations
  - Function expressions are not hoisted like function declaration, but they follow the same rules as variable hoisting
  - Function expression declarations variable names are hoisted but are not initialized until the line of code that initializes it is invoked

  What is different about var hoisting and let/const hoisting ? Why is this important ?
  - var variables are hoisted to the nearest function scope or global scope
  - var is implicitly assigned to undefined and then reassigned to another value


  Example 1

  What is output and how does JS see this code ?
        a = 2;
        var a;
        console.log(a);

  Example 2
  What is output and how does JS see this code ?
        console.log(a);
        var a = 2;


  Example 3
  What is the output of this code ? Why ?

        askQuestion();
        let studentName = "Suzy";

        function askQuestion() {
            console.log(`${ studentName }, do you know?`);
        }


  Example 4
  What is the output of this code and why ?
      foo();

      var foo;

      function foo() {
        console.log( 1 );
      }

  Example 5
    What is the output of this code and why ?

    foo = function() {
      console.log( 2 );
    };

    function foo() {
      console.log( 1 );
    }

    foo();

    foo = function() {
      console.log( 2 );
    };


  Example 6

    What is the output of this code and why ?

    greeting()

      var greeting = function greeting() {
          console.log("Hello!");
      };

  Example 7
  What is the output of this code and why ?
      console.log(studentName);


      let studentName = "Suzy";

  Bonus
  What is the output of this code and why ?
    foo();
    function foo() {
    console.log( 1 );
    }

    var foo = function() {
    console.log( 2 );
    };
    function foo() {
    console.log( 3 );
    }


4. Written Assessment

  Example 1

  What does the following code output ? Explain in plain english why ?

  [1,2,3].forEach(elem => console.log(elem));



  Example 2

  What does the following code return  ? Explain in plain english why ?

  ['ant', 'bear'].map(elem => {
    if (elem.length > 3) { return elem; }
  });


  Example 3

  What does the following code output ? Explain in plain english why ?

  let animal = "dog"

  const speak = animal => {
    if (animal === undefined) {
      console.log("Bark")
    } else {
      console.log("Meow")
    }
  }

  speak();
  ```

  Example 4

  What does the following code return  ? Explain in plain english why ?



5. Live Assessment

  Interview 1

  Given a string of integers, return the number of odd-numbered substrings that can be formed.

  For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

  solve("1341") = 7. See test cases for more examples.


  solve("1341") == 7
  solve("1357") == 10
  solve("13471") == 12
  solve("134721") == 13
  solve("1347231") == 20
  solve("13472315") == 28


  Interview 2

  Write a function that takes in a string of one or more words, and returns the same string,  but with all five or more letter words reversed. Strings passed in will consist of only
  letters and spaces. Spaces will be included only when more than one word is
  present.

  Examples:

  spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
  spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
  spinWords("This is a test") == "This is a test"
  spinWords("This is another test") == "This is rehtona test"
  spinWords(“‘test”’) == “‘test”’

  Interview 3

  Complete the function that accepts two integer arrays of equal length
  compares the value each member in one array to the corresponding member in the other
  squares the absolute value difference between those two values
  and returns the average of those squared absolute value difference between
  each member pair.

  Examples
  [1, 2, 3], [4, 5, 6]       //   9   because (9 + 9 + 9) / 3
  [10, 20, 10, 2], [10, 25, 5, -2]  // 16.5 because (0 + 25 + 25 + 16) / 4
  [-1, 0], [0, -1]               // 1   because (1 + 1) / 2

  Interview 4

  Given a string of words, you need to find the highest scoring word.

  Each letter of a word scores points according to its position in the alphabet:
   a = 1, b = 2, c = 3 etc.

  You need to return the highest scoring word as a string.

  If two words score the same, return the word that appears earliest in the original string.

  All letters will be lowercase and all inputs wabideill be valid.

  high('man i need a taxi up to ubud') == 'taxi'
  high('what time are we climbing up the volcano') == 'volcano'
  high('take me to semynak') == 'semynak'
  high('aaa b') == 'aaa'

*/
