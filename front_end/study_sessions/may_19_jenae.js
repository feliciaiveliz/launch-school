/*
DAYS_OF_THE_WEEK // legal, not proper
2nd // not legal
player1 // legal
evenNumbers // legal, not proper
art&music  // not legal
vehicle.speed // not legal
totalCount // legal
array // legal, proper
$total // legal, proper
numberOfCards // legal, proper
last-place // not legal
*/

// var example
var bar;
console.log(bar);
bar = 3;
console.log(bar);

// let example
console.log(foo);
let foo;
console.log(foo);

function say() {
  if (false) {
    var a = 'hello from inside a block';
  }
  console.log(a);
}

say();

let a = 'hello';

for (let index = 0; index < 5; index += 1) {
  let a = '2';
}

console.log(a);

let a = 1;

function foo() {
  a = 2;
  let bar = function() {
    a = 3;
    return 4;
  };

  return bar();
}

console.log(foo());
console.log(a);

let hello = function foo() {
  console.log(typeof foo);
};

hello();
foo();

let arr1 = [1, 2, 3];
let arr2 = [1, 2, 3];

console.log(arr1 === arr2);
console.log(arr1 == arr2);
