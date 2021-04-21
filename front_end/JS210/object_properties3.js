function copyProperties(obj1, obj2) {
  let count = 0;
  for (let name in obj1) {
    obj2[name] = obj1[name];
    count += 1;
  }

  return count;
}

let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};

console.log(copyProperties(hal, sal)); // 2
console.log(sal); // { model: 9000, enabled: true }
