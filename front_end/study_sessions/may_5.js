let a = '3';
let b = a;
a = a + ' another value';

console.log(a); // '3'
console.log(b); // 3 another value

// a ---> 0x123( mem address ) value : '3' is going to get stored in the address memory ( 0x123)

// b ----> 0X456, b = a , value '3' is copied to mem addr ( 0x456 )

function changeFirstElement(array) {
  array[0] = 9;
}

let oneToFive = [1, 2, 3, 4, 5];
changeFirstElement(oneToFive);
console.log(oneToFive);

// oneToFive ---> 023, value ---> 456
// 456 ---- > value [1, 2, 3, 4, 5]

// a[0] = 9
