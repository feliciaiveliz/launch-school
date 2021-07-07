/*
input: array of objects that contain information about bands
output: new array with fixed information about the bands
rules:
- all bands should have Canada as country
- all band names should be capitalized
- remove all dots from band names
algorithm:
- define capitalizeName() function:
  - iterate over the array of objects using for loop:
    - given object, declare 'fixedName'
      - split word into array of words and iterate using map()
      - uppercase each first letter of word and then join words together
      - return name
- define removeDots() function:
  - use replace() to replace '.' with ''
  - return word
- define fixCountry() function:
  - assign object.country = 'Canada'
  - return object
- define processBands() function:
  - pass object into each helper function:
  - return array of objects after processing
  */

  let bands = [
    { name: 'sunset rubdown', country: 'UK', active: false },
    { name: 'women', country: 'Germany', active: false },
    { name: 'a silver mt. zion', country: 'Spain', active: true },
  ];

  function capitalizeName(array) {
    let fixedName;
    for (let i = 0; i < array.length; i += 1) {
      fixedName = array[i].name.split(' ').map(word => word[0].toUpperCase() + word.slice(1))
                          .join(' ');
      array[i].name = fixedName;
    }
    return array;
  }

  function removeDots(array) {
    for (let i = 0; i < array.length; i += 1) {
      array[i].name = array[i].name.replace('.', '');
    }

    return array;
  }

  function fixCountry(array) {
    for (let i = 0; i < array.length; i += 1) {
      array[i].country = 'Canada';
    }
    return array;
  }

  function processBands(data) {
    capitalizeName(data);
    removeDots(data);
    fixCountry(data);
    return data;
  }

  console.log(processBands(bands));
  // console.log(capitalizeName(bands));
  // console.log(removeDots(bands));
  // console.log(fixCountry(bands));

  // // should return:
  // [
  //   { name: 'Sunset Rubdown', country: 'Canada', active: false },
  //   { name: 'Women', country: 'Canada', active: false },
  //   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
  // ]
