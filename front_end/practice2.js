# (DONE) Assignments & Comparisons

A **variable declaration** reserves space in memory for a variable with a particular name. There are `3` differnet ways to declare a variable in Javascript, using `var`, `let` or `const`. `var` variables were more commonly used before `ES6` but can still appear in older programs. `var` variables have **block-scope**, while `let` and `const` variables have `function-scope`. When writing programs, it is recommended to use `let` or `const` when declaring variables. On `line 1`, we **declare** a variable called `a` with keyword `let`. The variable is **initialized** and currently references a value of `undefined`. The `=` is called the assignment, or reassignment operator, depending on how it's used.

let a;
console.log(a); // undefined

In this example, we declare a variable called `x` with keyword `var`. It is also initialized to a value of `undefined` when it is not initialized to a value at the same time as it is being declared.

var x;
console.log(x); // undefined

`const` is a keyword that lets you declare and initialize a constant variable. Constant variables do not change. In this example, we declare and initialize a `const` variable to a value of `7`. `const` variables must be initialized to a value at the same time they are being declared. Otherwise, the program will throw an error: `SyntaxError: Missing initializer in const declaration`.

// const daysOfWeek = 7;
// console.log(daysOfWeek); // 7

const daysOfWeek;
console.log(daysOfWeek); // SyntaxError: Missing initializer in const declaration

In this example, `const` is used to declare and initialize a constant variable called `monthsInYear` to a number, `12`. This variable cannot be assigned to any other value.

const monthsInYear = 12;
console.log(monthsInYear); // 12
monthsInYear = 13;
console.log(monthsInYear); // SyntaxError: Identifier 'monthsInYear' has already been declared

# Variables as Pointers

On `line 1` we declare and initialize global variable `x` and set it to a value of `5`. On `line 4` we declare and initialize global variable `y` and set it to reference also the number `5`. Now both variables `x` and `y` reference `5`. On `line 7` we reassign variable `x` to reference the number `9`. `x` previously was pointing to `5` but is now pointing to `9`. Variable `y` still references the number `5` while `x` references `9`. Reassignment merely breaks the binding of a variable to a particular value and rebinds it to another value. It doesn't have an effect on the variables that are also referencing that value. As in the case of `y`, it still references `5`, while `x` was being reassigned to another value.

let x = 5;
let y = x;
x = 9;
console.log(x); // 9
console.log(y); // 5

# (DONE) Comparison of Objects with `===`

All comparison operators have a return value of one of two boolean values, `true` or `false`. The operator sits between two **operands**, which are the expressions to the left and right of the comparison operator.

The `===` **strict equality operator**, or the **identity operator**, checks to see if its **object** operands have the same value and are of the same type. In the case of objects, the `===` operator will return `true` if the operands are the same object and if they have the same values. Even if two objects hold the same values, it will not compare the values, only the object references. In this example, variable `a` is declared and initialized to an array object `[1, 2, 3]`. We also declare a variable `b` and initialize it to an array object of `[1, 2, 3]`. On `line 3` we use the `===` strict equality operator to compare `a` and `b` and we see that it returns `false`. Even though `a` and `b` reference array objects of the same values `1`, `2`, `3`, the operator will return `false` because they are not the same objects in memory.

let a = [1, 2, 3];
let b = [1, 2, 3];
a === b; // false

This time in the second example, we declare and initialize variable `b` and set it to reference the object that `a` is referencing. So now `a` and `b` both reference `[1, 2, 3]`, the same object in memory. This code example returns `true` because `a` and `b` are referencing the same object.

let a = [1, 2, 3];
let b = a;
a === b; // true

['1', '2', '3'] === ['1', '2', '3']; // false

# (DONE) Comparison of Primitives with `===`

In this example, we use the `===` operator to compare two **primitive** values. It compares primitives by value, not by references. In this example, variable `a` references a string with a value of `hi`. We then declare and initialize variable `b` to reference a string also with a value of `hi`. We use the `===` operator is used to test for equality and it returns `true` when comparing `a` and `b`. This code demonstrates that when comparing primitive values, the `===` operator compares them by value; only returning `true` if their values are the same and if they are of the same data type, in this case: `string`.

let a = 'hi';
let b = 'hi';
a === b; // true

In this example, we attempt to use the === strict equality operator while comparing two primitive values of different data types. This code example returns `false`. This is because `===` does not perform type conversion and only compares its operands as they currently are. Strings and numbers are not the same data types, so that is why this code returns false when we compare string '7' and number 7 using `===.

'7' === 7; // false

In this example, we declare and initialize global variable `a` and set it to reference a string with a value of `hi`. On `line 2` we declare global variable `b` and set it to reference `a`, that is, it is now referencing the value of `a`. The `===` operator is used on `line 3` to compare `a` and `b` and it returns `true`. This is because `a` and `b` reference a value of the same type and same value.

let a = 'hi';
let b = a;
a === b; // true

# (DONE) Comparison of Primitives with `==`

The `==` **non-strict equality operator**, or the **loose equality operator**, works in a similar way to `===` in that it compares operands to see if they have the same value, but it could perform **coercion** if one of its operands is of a different type than the other operand. In this example, we compare two numbers, `7`, and we see that `==` returns `true` because both operands are numbers and they have the same value, `7`.

7 == 7; // true

In this example, we compare number `7` to string `'7'`. In this case, `==` performs coercion: converting the string `'7'` to number `7` and *then* performing the comparison. Sometimes this operation can lead to unexpected results as it can be unclear which of the types will be converted to a different data type. It is recommended to always use the strict equality operator to avoid this confusion.

'7' == 7; // true

# (DONE) Comparison of Objects with `==`

The `==` loose equality operator compares objects in a similar way to `===` in that it checks if its operands are the *same* object, regardless if they have the same values within them. In this example, the `animals` object and the `pets` object both contain the same properties, with each name/value pair having the same values. However, they are still two different objects, thus if we compare these objects either with `==` or `===`, we are returned `false`.

let animals = {
  cat: 1,
  dog: 3,
}

let pets = {
  cat: 1,
  dog: 3,
}

animals == pets; // false

If we compare an array to a type that is not an array, `==` will implicitly coerce the non-array item into a string. Empty arrays in Javascript when compared to non-array items will be coerced to **empty strings** `''`.

// Some examples of implicit array coercion:

console.log([] == 'a');  // (false) [] -> '' == 'a'
console.log([] == true); // (false) [] -> '' == true

// Empty strings '' in JS are falsey in nature.

# Variable Scope

Variable scope determines the accessibility of variables in a program. A variable's scope depends on where the variable is declared in a program. Javascript has global, function, block, local and function scope.

**Global** scope is a single scope that contains code that does not exist within a function or a block. Globally scoped variables are available everywhere in a program, even within nested functions or blocks. In this example, we declare a global variable with `let` called `shoe` and set it to reference a string with a vlaue of `Converse`. Using `console.log()`, we pass in `shoe` it as an argument and log its value to the console, `Converse`. This code example shows a variable that is declared and initialized the in the global scope because it is outside of any function or block.

let shoe = 'Converse';
console.log(shoe); // Converse

**Local scope** refers to scope that is created by **blocks or functions**. Variables that are declared in this scope are not accessible outside of the block or function. These variables are in a scope that is entirely self-contained with respect to the function or block.

**Function** scope is scope that local to a function definition. Any variables that are declared within a function definition have function scope. These variables are in a local scope to the function and cannot be accessed outside of the function definition. Variables declared in the global scope or surrounding scope are accessible within the local scope of a function definition, but variables declared in an inner function scope cannot be accessed outside of the function definition. Global variables are accessible within nested functions and blocks because they are available everywhere in a program.

In this example, we declare a **global** variable `greeting` and set it to reference a string with a value of `Howdy!`. From `lines 3-5` we define a function declaration called `sayGreeting()`. A block is defined from `lines 3-5`, within which a new inner function scope is created. In this inner scope, we invoke `console.log()` and pass in global variable `greeting` to it as an argument to log its value to the console, which is `Howdy!`. Invoking the `sayGreeting()` function on `line 7` logs `Howdy!` to the screen and returns `undefined`. This code example demonstrates that global variables are accessible to an inner scope created by a function block.

let greeting = 'Howdy!';

function sayGreeting() {
  console.log(greeting);
}

sayGreeting(); // Howdy!

**Lexical scope**, also called **static scope**, looks to the source code to determine the scope of a variable. This scope is used by Javascript to determine where to find variables. Functions create a scope even if it is never executed in a program. Javascript looks for variables bottom to top, from local scope to global scope.

**Block scope** is created when you declare a variable with either the `let` or `const` keywords. `Switch` statements, `if/else if/else if/else` statements, `do...while`, `while`, and `for` with code between curly braces `{}` all indicate the presence of a block and therefore a block scope. Blocks typically are created by curly braces surrounding a set of expressions or statements.

In this example, the `if` conditional statement evaluates the expression in the parentheses `7 === 7` and depending on the return value of the expression, the code within the block will execute, `console.log(7 equals 7);`. Since `7 === 7` evaluates to `true`, the block is executed, thus `7 equals 7` is logged to the console and `undefined` is returned.

if (7 === 7) {
  console.log('7 equals 7');
}

// 7 equals 7

# How Variables Interact with Function Definitions

In Javascript, a variable declared in the global scope or outer scope is accessible to an inner scope, even if that scope is nested. Parameters aren't required if a variable in the outer scope is needed within a function or block.

# Function Scope

**Function scope** is local to a function. Any variables declared within a function have function scope. These variables cannot be accessed from outside of the function. However, variables declared in the global scope or outer surrounding scope are accessible within the function declaration or expression.

In this example, on `line 1` we declare and initialize a global variable called `food` and set it to reference a string with a value of `pizza`. The `favorite_food()` function declaration returns a template string with the value of `My favorite food is ${item}!`. On `line 4` we declare a local variable `item` and initialize it to the string value that `food` is referencing in the global scope, `pizza`. This allows us to log the value of that is referenced by `food` and `item` within a template string. The return value of `favorite_food()` function declaration is `My favorite food is pizza!`. The `item` local variable has function scope, which means that it is in the local scope of the `favorite_food()` function declaration and cannot be accessed outside of the function as we can see by the error message returned on `line 9`.

let food = 'pizza';

function favorite_food() {
  let item = food;
  return `My favorite food is ${item}!`;
}

console.log(favorite_food()); // My favorite food is pizza!
console.log(item); // ReferenceError: item is not defined

# (DONE) Hoisting

Hoisting is a term that refers to a behavior in Javascript where variable declarations are 'moved' to the top of the current scope of a program in the **creation phase**. It doesn't actually move any code, but it's a way to visualize what happens before code is actually executed in the **execution phase**. Variables declared with `let`, `const` and `var` behave differently when it comes to hoisting.

Variables declared with `var` are given an initial value of `undefined` when they are hoisted to the top of their respective scope. If we attempt to access a `var` variable before we initialize it to a value, the program will return `undefined` until we execute the line of code that initializes a value to the `var` variable.

In this example, we pass in global variable `a` to `console.log()` as an argument to log its value to the console. On `line 2` is when we actually declare and initialize global variable `a` and set it to reference the number `7`. This code example logs `undefined` and returns `undefined`. When `var` variables are hoisted, only the varaible declaration part of the statement is hoisted to the top of its scope, not the initialization expression. This is why we see the logged output of `undefined`. Example 2 demonstrates what the interpreter is doing when it is hoisting a `var` variable. The `var` variable `a` is not initialized to a value until after `console.log(a);` is run.

**Example 1**

console.log(a); // undefined
var a = 7;

**Example 2**

var a;
console.log(a); // logs undefined
// returns 'undefined'
a = 7;
console.log(a); // 7
// returns 'undefined'

**let**

When variables declared with `let` are hoisted, they are not given an initial value at all. They are not `undefined`, but they are simply said to have no value. These variables are 'unset' and are in the **temporal dead zone**. An error will be thrown if an attempt is made to access a `let` variable before it has been initialized to a value.

In this example, we pass in a global variable `a` to `console.log()` as an argument and attempt to log its value to the console. This raises a `ReferenceError` because global variable `a` is unset, or it doesn't have a value.

console.log(a); // ReferenceError: a is not defined
let a = 5;

let a;
console.log(a); // undefined
a = 5;

**const**

Variables declared with `const` are also not given an initial value when they are hoisted, similar to `let` variables. However, `const` variables must be declared and initialized at the same time, otherwise an error will be thrown that the `const` variable is missing an initializer statement. This is because `const` variables are meant to be constant in nature: they are not meant to be reassigned to a different value once they've been declared and initialized to an initial value.

In this example, we declare a `const` variable `s` but do not initialize it to a value. On `line 2` we attempt to log the variable `s`'s value to the console, but an error is thrown: `Missing initializer in const declaration`. On `line 3` after `console.log()`, we attempt to assign a number value of `9` to `s`, but the program never reaches this line of code because the error message stopped the program.

const s;
console.log(s);
s = 9;
console.log(s);

In this example, we declare and initialize `const` variable `s` to a value of number `9` on the same line. Using `console.log()`, we log its value to the console, `9`. This does not throw an error.

const s = 9;
console.log(s);

# (DONE) Primitive Values, Types & Type Conversions / Coercions

There are `8` **primitive** data types in Javascript: `String`, `Number`, `Boolean`, `Undefined`, `null`, `symbols`, and `bigInts` and `NaN`. Primitive data types are types that Javascript represents at the lowest level of implementation of the language. You cannot modify these data types in any way, as they are **immutable**. Operations such as reassignment appear to modify these values but in reality Javascript is just reassigning new values to these variables without modifying the actual original value. You cannot call methods on primitive data types; the data type's object counterpart creates a wrapper around the value and then the method is called on that wrapper object. A new object is returned by the method, and the original value is left unchanged.

In this example, we call a string method `slice()` on a string `Felicia` that is being reference by global variable `name`. Using `console.log()`, we log the value of calling `slice()` on `Felicia` and passing in two arguments to `slice()`, the first argument being the index to start the slice and the second argument to indicate the end of the slice. `Line 2` logs `el` to the console and returns `undefined`. Using `console.log()` again on `line 3`, we pass in the `name` variable to it as an argument to log its value, which is `Felicia`. This demonstrates that the original string value that is saved to `name` is preserved, and unmodified. The `slice()` method returns a *new* string and only performs its operation on a new string object.

let name = 'Felicia';
console.log(name.slice(1, 3)); // el
console.log(name); // Felicia

In this example, we call the `split()` method on the string value `Felicia` that is being referenced by the global variable name. We can see that the original value of the string `Felicia` is unchanged, and that Javascript implicitly coerces the primitive string value to its respective object, `String`. `split()` then operates on this new String object of the same value, Felicia, returning an array of characters split on the delimiter: `['F', 'e', 'l', 'i', 'c', 'i', 'a']`. On `line 4` we log the value of name and we can see that the original string value indeed has not been modified in any way.

let name = 'Felicia';

console.log(name.split('')); // [ 'F', 'e', 'l', 'i', 'c', 'i', 'a' ]
console.log(name); // Felicia

**Type Conversions & Coercions**

Javascript uses two types of **coercion**, **implicit-type coercion** and **explicit-type coercion**.
Implicit coercion occurs when Javascript is attempting to compare two values that are not the same data type. For example, when concatenating two values, it needs two strings as its operands. If one of the operands is a **number**, Javascript will implicitly coerce that number to a **string** and *then* perform concatenation.

This code example demonstrates implicit type coercion. Javascript uses the `+` concatenation operator to combine two strings together. In this case, we want to combine string `'3'` and number `3`. Instead of raising an error that we are attempting to combine two different values of data types, Javascript implicitly converts the number `3` to a string `'3'`. This code returns the string `'33'`.

'3' + 3 // '33'

When it comes to the other arithmetic operators, `-`, `*`, and `/`, Javascript will convert one of its operands (the one that is not a number), into a number and perform the mathematical operation.

In this example, we declare and initialize global variable `x` and set it to a value of string `'4'`. On `line 2` we declare and initialize variable `y` and set it to a value of number `2`. On `line 3` we use `console.log()` and pass in `x - y` to it as an argument to log its value of number `2` to the console. We see that Javascript *temporarily* coerces the string `4` to number `4` to carry out its operation. Using the `typeof` operator on `lines 4-5`, we see that indeed the data types of the variables `x` and `y` have not changed: `x` still references a string and `y` still references a number.

let x = '4';
let y = 2;
console.log(x - y);    // 2
console.log(typeof x); // string
console.log(typeof y); // number

**Explicit Type Coercion**

Explicit type coercion lets you be in control when it comes to which values you want to coerce into different values in your program. Implicit type coercion is when the engine performs coercion without a programmer deciding what to coerce.

In this example, we want to mathematically add two numbers, but they are actually string data types. Using the `Number()` function, we can convert the string to a number as long as it has a valid number value and then perform the addition. We pass in string `8` to `Number()` as an argument and it returns number `8`. We then pass in string `7` to `Number()` as an argument and it returns number `7`. Now that both `8` and `7` are numbers, we can add them together. This code returns number `15`.

Number('8') + Number('7') // 15

In order to convert numbers to strings, we can use the `String()` function. `String()` takes a number argument and converts it to a string. We could use this return value to perform concatenation since the return value of `String()` is always a string data type.

In these two example, we use `String()` to convert the number `3` to string `3`. This allows us to concatenate the strings and return `33`.

String(3) + String(3) // '33'

String(3) // string '3'

Javascript also has the `parseInt()` function that converts a string with a numeric value to a number. It can take a number as an argument that can optionally start with either `+` or `-`. It converts the string to a number, but it if encounters a character that is invalid, it stops and returns the whole number.

In this example, we want to convert string `123abc` using `parseInt()`. We pass `123abc` to `parseInt()` as an argument and using `console.log()`, we see that number `123` is logged to the console. On `line 2`, we declare a `result` variable and set it to reference `parseInt('123abc')`. On `line 3` using `console.log()` we pass in `typeof result` to it an argument to log its value, which returns `number`. This demonstrates that `parseInt()` returns a number that was converted from a string. Any non-numeric characters (excluding `+` and `-`) are disgarded.

console.log(parseInt('123abc')); // 123
let result = parseInt('123abc');
console.log(typeof result); // number

# Object Properties & Mutations

Objects in Javascript contain data and behavior. They use curly brace syntax `{}` to contain **properties**. Properties are key(or name)/value pairs that represent attributes of an instance of an object??? The keys are named items and the values are the attributes for the object. These objects can have multiple values or properties stored within them. Objects in Javascript are **mutable**, which means that they can be modified in place. To add a new property to an object, we can the dot `.` notation.

In this example, we use `.` dot notation to add a new property to an object, `plays`. We declare and initialize `plays` and set it to reference an empty object `{}`. Using `.` we add a new name/value pair: `title: Hamlet` to the `plays` object. We invoke `console.log()` on `line 3` to log the value of the newly updated object and we indeed see that the object has a new property added to it.

let plays = {};
plays.title = 'Hamlet';
console.log(plays); // { title: 'Hamlet' }

To update the value of a property we can use either `.` dot notation or `[]` bracket notation. In this example, we previously assigned a value of `Hamlet` to the name `title`, but using the `.` dot notation we update the value and now set it to reference `Othello`, on line `5`. On `line 6` we log the newly updated object and we see that the value of the property is now `Othello`.

let plays = {};
plays.title = 'Hamlet';
console.log(plays); // { title: 'Hamlet' }

plays.title = 'Othello';
console.log(plays); // { title: 'Othello' }

In this example, we declare a custom `pet` object that contains `3` pieces of data within it. Each name/value pair represents a pet type and a name for the pet. All keys in Javascript objects are represented as strings and values are any valid expressions. We can acess the value of a pet's name using `.` dot notation or `[]` bracket notation. using `console.log()` on lines `7-9`, we pass in `pets.dog`, `pets.cat` and `pets['chicken']` respectively. This logs `Neptune`, `Lucifer` and `Peep` to the console and returns `undefined`. Using either dot notation or bracket notation we see that we can access the value of a name in an object.

let pets = {
  dog: 'Neptune',
  cat: 'Lucifer',
  chicken: 'Peep',
};

console.log(pets.dog);        // Neptune
console.log(pets.cat);        // Lucifer
console.log(pets['chicken']); // Peep

# (DONE) Understand the differences between loose and strict equality

`===` is the strict equality operator, or the identity operator. `==` is the non-strict equality operator, or the loose equality operator. `==` coerces one of its operands to the other's type before comparison if they are of different types. The difference between loose and strict equality is that loose equality checks to see if both of its operands have the same value, not if they are the same object, which is how the strict equality operator compares objects. For the strict equality operator, it will only return true if both of its operands are the same type and if they have the same value. It is recommended to use `===` mostly if possible to avoid the confusion of conversion with `==`.

`==` is the non-strict equality operator, or the loose equality operator. `==` coerces one of its operands to the other's type before comparison if they are of different types.

7 == 7   // true
7 === 7  // true

7 == '7' // true
7 === '7' // false

# (DONE) How passing an argument into a function may or may not permanently change the value that a variable contains or points to

Whether or not a function mutates a value that is referenced by a variable depends on what type of data the value is and if a **mutating** operation is
called on the value. If the argument is any one of Javascript's primitive values, (strings, booleans or numbers), than the function cannot mutate or modify it. If the argument is an array or object, than there's a chance that the argument's values can be mutated or modified.

In this example, `numbers` is an array containing `5` digits. The array itself is an object, which means that it is mutable. The digits contained within the array are primitive values, which are not themselves mutable. Within the `reservedArray` function declaration, we invoke the `reserve()` method on the passed in array argument, permanently altering the order in which see the digits in the array. We output the return value of the function declaration after the reversal operation, which returns `[5, 4, 3, 2, 1]`. We then log the original value of the `numbers` array and see that it is indeed modified permanently by the `reversedArray()` function declaration.

function reversedArray(array) {
  return array.reverse();
}

let numbers = [1, 2, 3, 4, 5];
console.log(reversedArray(numbers)); // [ 5, 4, 3, 2, 1 ]
console.log(numbers); //[ 5, 4, 3, 2, 1 ]

# (DONE) Working with Strings, Arrays, and Objects. In particular, you should be thoroughly familiar with the basic Array iteration methods (forEach, map, filter, and find) and how to use Object methods to access the keys and values in an Object as an Array

**forEach()**

The `Array.prototype.forEach()` method executes a function for each element of an array. The return value for `forEach()` is `undefined`. In this example, we declare and initialize a global variable `seasons` that references a 4-element array. Each element is a string that represents a season. Using `forEach()`, we iterate over the `seasons` array and execute the function `(season => console.log(season)` for each element. This arrow function logs each season to the console using `console.log()` on its own line. `forEach()` accepts a **callback function** as an argument, in this case it is: `(season => console.log(season)`, and applies this function to every element in the array.

let seasons = ['spring', 'summer', 'fall', 'winter'];

seasons.forEach(season => console.log(season));

// spring
// summer
// fall
// winter

**map**

The `Array.prototype.map()` method returns a new array containing the results of executing the provided callback function for each element in the array argument. In this example, we declare and initialize a global variable called `seasons` and set it to reference a 4-element array. Each element is a string that represents a season. On `line 3` we declare and initialize a `result `variable and set it to reference the return value of calling `map()` on the `seasons` array. Using `map()`, we can provide a callback function `season => season.toUpperCase()` that takes each string element and uppercases it using `toUpperCase()`. This callback function is applied to each element in the array, return a new result. This will not modify the original elements of the `seasons` array, but instead will return a **new** array that contains these transformed elements. We invoke `console.log()` on `line 4` and pass in the `result` variable to it as an argument to log its value of `[ 'SPRING', 'SUMMER', 'FALL', 'WINTER' ]`. On `line 5` we invoke `console.log()` again, passing in `seasons` which logs `[ 'spring', 'summer', 'fall', 'winter' ]`. These two calls to `console.log()` on `line 4` and `line 5` return `undefined`.

let seasons = ['spring', 'summer', 'fall', 'winter'];
let result = seasons.map(season => season.toUpperCase());

console.log(result);  // [ 'SPRING', 'SUMMER', 'FALL', 'WINTER' ]
console.log(seasons); // [ 'spring', 'summer', 'fall', 'winter' ]

**filter**

The `Array.prototype.filter()` method returns a new array that contains all the elements of the argument array that evaluate to `true` by the function. In this example, we declare and initialize an array called `numbers` and set it to reference an array `[1, 2, 3, 4, 5]`. We use the `filter()` method to only keep elements that can be coerced to `true` in a boolean context. We use `n % 2 == 1` to only keep numbers that are odd. The new array will contain numbers `1`, `3`, `5`. The return value of calling this method on `numbers` is `[1, 3, 5]`.

let numbers = [1, 2, 3, 4, 5];

numbers.filter(n => n % 2 == 1); // [1, 3, 5]

**find**

The `Array.prototype.find()` method returns an element from the provided array argument that satisfies the function. `undefined` is returned if no elements in the array can evaluate to `true` for the testing function. In this example, we want to return the string whose length is greater than `4`. We achieve this by calling the `find()` method on the `flowers` array. The function that is passed to `find()` evaluates each value in the array and returns a boolean based on the return value of the expression, `flower.length > 4`. The return value is `orchid`.

let flowers = ['rose', 'lily', 'orchid'];

flowers.find(flower => flower.length > 4); // orchid

**Objects**

We can use a `for..in` loop to iterate over the properties of an object and access their names and values. In this example, we have a `pets` object that contains two properties, one for a dog and the other for a cat. We use `for..in` to log a sentence to the console that contains the pet's type and their name:

let pets = {
  dog: 'Neptune',
  cat: 'Lucifer',
};

for (let pet in pets) {
  console.log(`We have a ${pet} named ${pets[pet]}.`);
}

// We have a dog named Neptune.
// We have a cat named Lucifer.

**Arrays**

Arrays in Javascript are actually objects. They contain key/value pairs. In this example, we declare and initialize the global variable `books` to an array that contains two books. We log the value of `typeof books` to the console and see that the array is in fact an `object`. We can use the `Object.keys()` method to return an array that contains strings with the index value of the books in the array. Using `Object.values()`, we see the values that are associated with the property's keys. We can create an object with the same properties as the `books` array and they would be equivalent in value, as we demonstrate on lines `6-9`.

let books = ['Harry Potter', 'Middlemarch'];
console.log(typeof books);         // object
console.log(Object.keys(books));   // ['0', '1']
console.log(Object.values(books)); // ['Harry Potter', 'Middlemarch']

// let books = {
//   '0': 'Harry Potter',
//   '1': 'Middlemarch',
// };

To determine whether or not you have an array object, you can pass in the array or variable to `Array.isArray()`. This method returns a boolean value to indicate whether the object you pass to it is an array.

Array.isArray([1, 2, 3]);  // true
Array.isArray('meow');     // false

# (DONE) Variables as Pointers

Variables in Javascript are containers for values. They reference or point to values in memory. Variables can be declared and initialized to any data type, including strings, numbers, booleans, and even functions. Variables can reference primitive data types and objects. In this example, we declare and initialize global variable `a` to a number with a value of `7`. On `line 2` we declare and initialize global variable `b` and set it to reference `a`. So now, `a` and `b` both reference `7`. We then reassign `a` to `5`. `a` now references `5` and `b` still references `7`. This example demonstrates that variables in Javascript simply point to values in memory space and they can be reassigned to different values. This doesn't modify the original value that the variable was pointing to or effect other variables that are pointing to that value. In this case, reassigning `a` to point to a different number had no effect on `b`.

let a = 7;
let b = a;
a = 5;
console.log(a); // 5
console.log(b); // 7

# `console.log` vs. `return`

`console.log` is a method that tells Javscript to log some kind of value or output to the console. `log` means to print or display something to the screen or browser. In this example, we pass in a string with a value of `meow` to the `console.log()` method and we expect it to log the value of the string, `meow`, to the console. The `undefined` is the return value of the expression. Since there is nothing being returned, we see `undefined`.

console.log('meow'); // logs 'meow'
// returns 'undefined'

All Javascript functions **return a value**, or evaluate to a value. `undefined` is the **implicit return value** of most JS functions unless you include an explicit `return` statement somewhere inside the function. In this example, the `greeting` function accepts a single string parameter and inside the function it **returns** the value of the string to the caller.

function greeting(string) {
  return string;
}

console.log(greeting('Howdy friend!')); // Howdy friend!

We can assign the return value of the function to a variable `a` and see that this `greeting` function has a return value of `Hi mom!`, since this value is being explicitly returned to the caller by the return statement on `line 2`.

function greeting(string) {
  return string;
}

console.log(greeting('Hi mom!')); // greeting function returns Hi mom!
// console.log call returns `undefined`

# (DONE) Truthiness: `false` and `true` vs. `falsy` and `truthy`

`true` and `false` are Javascript's two boolean values. Javascript also has a feature where it can coerce *any* value to a boolean value. A value that is not in itself a boolean can either be `truthy` or `falsey`, or evaluate to `true` to `false` in boolean contect. In this example, variable `a` references the number `7`. This expression *evaluates to true* in a boolean context and therefore the code `I'm truthy!` is executed. However, to say that `a` is `true` or equal to `true` is false. `a` can only be considered `truthy`.

let a = 7;

if (a) {
  console.log("I'm truthy!");
} else {
  console.log("I'm falsey!");
}

// logs "I'm truthy!"

console.log(a == true); // false

Javascript treates `6` values as being `false` or `falsey`: `false`, `0`, (and all variants `0`, `-0`, and `0n`), empty string `''`, `NaN`, `undefined`, and `null`.

[] == false; // true
'' == false; // true
0 == false; // true

You can use the `!` operator to force a value to its boolean opposite. In this example, we take the string `'cat'` and use it with `!` to convert it to its boolean opposite. This returns `false`.

!'cat' // false

You can use the `!!` operator to force a value to its boolean equivalent. In this example, we take the same string `'cat'` and use it with `!!` to convert it to its boolean opposite value of `true`. It actually works as two seperate operations. This expression `!!'cat'` is equivalent to `!(!'cat')`. The `!` inside the parentheses forces the `'cat'` string value to become a boolean, in this case `false` and the outer `!` forces the opposite of `false`, which is `true`.

!!'cat' // true

!(!'cat') // true

# Function definition and function invocation

Functions is Javascript are procedures, contain code that is extracted to a single place so that it may be called from anywhere in a program. Instead of writing the code each time you need to run it, you can write a function and call it as many times as needed. To define a function definition, use the keyword `function`, followed by the function's name and parenthese `()`. The **function body** contains the code needed to be executed and is placed in between curly braces `{}`. A function declaration can be passed to `console.log()` as an argument to log its value. If the function declaration contains any parameters, you pass those into the function declaration as arguments when you invoke it with `console.log()`.

In this example, we define a function declaration called `welcome()` that takes a string value greeting and logs it to the console with `console.log()` on `line 2`. There are no arguments being passed to this function, so when we invoke the function declaration, we can leave the parentheses empty `()`. We pass the function declaration `welcome()` to `console.log()` as an argument to log its value to the console, which is `Welcome to Texas!`. The `welcome()` function declaration returns `undefined`. All function definitions in Javascript return `undefined` unless an explicit `return` statement with a meaningful value is used within the function definition.

function welcome() {
  console.log("Welcome to Texas!");
}

console.log(welcome()); // logs Welcome to Texas!
// returns undefined

In this example, the `divide()` function declaration takes two parameters, `x` and `y`. When we invoke the `divide` function declaration, we pass in `10` and `5` into `divide()` as arguments. These values will be assigned to the local variables (the parameters we defined) `x` and `y` respectively. This allows the `divide()` function declaration access to the values `10` and `5` to carry out division. Within `divide()` on `line 2` we return the results of `x / y`, or `10 / 5` which returns `2`.

function divide(x, y) {
  return x / y;
}

console.log(divide(10, 5)); // 2

If you invoke a function definition and pass in **too few** arguments to it, it will not raise an error. Instead, argument that weren't passed in within the function definition will have a value of `undefined`. In this example, the `multiply` function declaration accept two parameters, `a` and `b`. Within the funciton declaration we log the values of `a`, `b` and `a + b` on seperate lines. If we omit the argument for `b` we see that we can log the value of `a` within the function, which is `4`, however we see that the value of `b` is `undefined`. This is because we did not pass in a value for `b`, so Javascript gave it a value of `undefined`. When we log the value of `a + b`, we get `NaN` because the result of adding any number to `undefined` is always `NaN`.

function addNumbers(a, b) {
  console.log(a);     // 4
  console.log(b);     // undefined
  console.log(a + b); // NaN
}

console.log(addNumbers(4));
// returns 'undefined'

If you pass in **too many** arguments to a function, it won't raise an error. However, it will simply ignore the extra argument. In this example, we pass in an extra argument to the `addNumbers()` function declaration, `6`. We can log the value of `a`, which is `4`, log the value of `b`, which is `5`, and finally compute the result of `a + b`, which is `9`. `6` is not used within the `addNumbers()` and is thus ignored. The `addNumbers()` function declaration logs `9` to the console and returns `undefined`.

function addNumbers(a, b) {
  console.log(a + b);
}

console.log(addNumbers(4, 5, 6)); // 9
// returns 'undefined'

# (DONE) Function declarations, function expressions, and arrow functions

**Function declarations** always start with the keyword `function`. If a function definition starts with anything other than `function`, it is a function expression. A function is created when you define it with the `function` keyword. They are useful for extracting code to one place so that it may be used in other parts of a program. Function declarations are hoisted to the top of the current scope, which allows for the programmer to invoke them before they are defined. Following the `function` keyword is the function's name combined with parentheses. Inside the parentheses is where parameters for the function definition are defined, if they are required. The code body is written within the block created by two curly braces `{ }`. To invoke a function, call it by its name with parentheses. If the function declaration accepts parameters, then arguments will beed to be passed into the function definition at invocation. Function declaration blocks define and create a new inner function scope. This is a scope that is local the function. Any variables declared within the function declaration are locally scoped with respect  to the function and are not accessible outside of it. Variable in the outer surrounding scope however are available to the inner scope of the function declaration.

In this example, the `celebrate()` function declaration accepts one parameter, `message`, and within the inner scope created by the block on `line 1` we pass in local variable `message` to `console.log()` as an argument, loggin its value to the console. On `line 5` we invoke the `celebrate()` function and pass in the string `Happy Birthday!!` to it as an argument. This string will be assigned to the local variable `message` within the function definition to be used within the function body. This code example logs `Happy Birthday!!` to the console and returns `undefined`. This is an example of defining a function declaration and invoking it with an argument. This function declaration can then be used in other parts of the program.

function celebrate(message) {
  console.log(message);
}

console.log(celebrate('Happy Birthday!!')); // logs Happy Birthday!!
// returns 'undefined'

In this example, we invoke `console.log()` and pass in the `celebrate()` function declaration *before* we define the function declaration in the program. This code works because of a concept called **hoisting**. Hoisting 'moves' the entire function declaration to the top of the current scope, including the code body. The code doesn't actually move, but it's just a way to visualize what's happening in the creation phase when function declarations are moved to the top of the scope.

console.log(celebrate('Happy Birthday!!')); // Happy Birthday!!
// returns 'undefined'

function celebrate(message) {
  console.log(message);
}

**Function expressions** are similar to function declarations, except that function expressions are part of a larger expression syntax. This expression syntax is usually variable assignment. If a function definition starts with anything other than the keyword `function`, it is a function expression. The main difference between function expressions and function declarations is that function expression cannot be invoked before it is defined in a programs. Function expressions are not hoisted in the creation phase like function declarations. If you try to invoke a function expression before it is defined, the program will raise an error.

In this example, we declare and initialize global variable `celebrate` and assign it to an anonymous function expression. Within the block we invoke `console.log()` and pass in the string `Happy Birthday!!` to it as an argument. On `line 5` we invoke the `celebrate()` function expression, logging its value of `Happy Birthday!!` to the console and returning `undefined`. On `line 6` we invoke `console.log()` and pass in `celebrate` to it as an argument to log its value, which is `function`. This makes sense, since we define an anonymous function expression and assign it to global variable `celebrate`.

let celebrate = function() {
  console.log("Happy Birthday!!");
};

celebrate(); // Happy Birthday!!
console.log(typeof celebrate); // function

In this example, we attempt to call `celebrate()` before we have defined the function expression in the program. Unline function declarations, function expressions are not hoisted to the top of the scope in the creation phase. This action results in the error being thrown. It is best practice to define function expressions before invoking them.

celebrate();

let celebrate = function() {
  console.log("Happy Birthday!!");
};

// celebrate();
^

// ReferenceError: celebrate is not defined

**Arrow functions**, or callback functions, look similar to function expressions, except that the syntax is slightly different. They are usually written on one line. Arrow functions have an implicit return property. The `return` statement is not required in the body of the arrow function **only** if there is a single expression as the body. The single expression, or subexpressions within the expression, must only evaluate to a single value. Otherwise, the `return` statement is then required. If this is the case, curly braces `{}` must also be used. Arrow functions are called callback functions because they can be passed in as arguments to other functions.

In this example, the `forEach()` method evaluates a callback function for each element in the array argument. We can use an arrow function instead to simplify the code. Examples `1`, `2`, and `3` all log `2`, `4`, and `6`, to the console and return `undefined`. Example `1` is written with a callback function passed to the `forEach()` method. In example `2`, we use an arrow function and omit the `function` keyword entirely. Since the code is now all on one line, we don't need to use curly braces `{}`. In example `3`, we use the same array function but the only difference is that we can omit the parentheses around `number` since it is the only parameter in the arrow function.

// Example 1

[2, 4, 6].forEach(function (number) {
  console.log(number);
});

// 2
// 4
// 6

// Example 2

[2, 4, 6].forEach((number) => console.log(number));

// 2
// 4
// 6

// Example 3

[2, 4, 6].forEach(number => console.log(number));

// 2
// 4
// 6

In this example, we define an arrow function expression called `add()`. It accepts two number parameters. Within the body of the function expresision, we `return a + b`. Since `a + b` is the only expression within the code body, we can omit the `return` keyword entirely. On `line 2` we pass in the numbers `7` and `5` to the `add()` function expression as arguments. These arguments will be assigned to `a` and `b` respectively so that they may be used within the body of the function expression. The `add()` function expression logs `12` to the console and returns `12`.

let add = (a, b) => a + b;
add(7, 5); // 12
// returns 12

# Implicit return value of function invocations
