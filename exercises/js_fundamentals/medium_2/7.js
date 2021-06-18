function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne(...args) {
    let result = '';
    for (let i = 0; i < args.length; i += 1) {
      result += String.fromCharCode(args[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101));
    anotherOne(116, 111);
  }

  anotherAnotherOne();
  anotherOne(116, 104, 101);
  return anotherOne;
}

console.log(one()(77, 97, 116, 114, 105, 120, 33));

// 87 -> W
// 101 -> e
// 108 -> l
// 99 -> c
// 111 -> o
// 109 -> m
// 101 -> e

// 116 -> t
// 111 -> o

// 116 -> t
// 104 -> h
// 101 -> e

// 77 -> M
// 97 -> a
// 116 -> t
// 114 -> r
// 105 -> i
// 120 -> x
// 33 -> !
