var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}

// logs: The total value is 15

// After hoisting

function counter(count) {
  // ...
}

// var counter; -> ignored because it's duplicate
var rate;

counter = 5;
rate = 3;

console.log('The total value is ' + String(counter * rate));

///////////////////

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;

// After hoisting

function counter(count) {
  // ...
}

// var counter; -> duplicate; ignored
var rate;

console.log('The total value is ' + String(counter * rate));

counter = 5;
rate = 3;

// logs: The total value is 15

///////////

var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

// After hoisting

function counter(count) {
  // ...
}

// var counter; -> duplicate; ignored
var rate;

counter = 5;
rate = 3;

console.log('The total value is ' + String(counter * rate));
// logs: The total value is 15

///////////////////////

let counter = 5;
let rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

// Hoisting doesn't occur in this example. A syntax error is raised on line 4. This is because we declare a counter variabe on line 1
// and then try to declare another counter variable (as a function declaration) on line 4.

console.log('The total value is ' + String(counter * rate));
// error, 'counter' has already been declared
