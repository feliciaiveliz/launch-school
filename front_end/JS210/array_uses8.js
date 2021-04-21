function endsOf(beginningArr, endingArr) {
  return [beginningArr[0], endingArr[endingArr.length -1]];
}

console.log(endsOf([4, 8, 15], [16, 23, 42]));
