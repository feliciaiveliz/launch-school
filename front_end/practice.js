function foo() {
  return bar();

  function bar() {
    return 42;
  }
}

console.log(foo());
