function clone(obj) {
  return Object.assign({}, obj);
}

let person = {
  title: 'Duke',
  name: {
    value: 'Nukem',
    isStageName: true
  },
  age: 33
};

let clonedPerson = clone(person);
person.age = 34;

console.log(person.age);
console.log(clonedPerson.age);

person.name.isStageName = false;
console.log(person.name.isStageName);
console.log(clonedPerson.name.isStageName);

// A shallow copy returns a new object that is a copy of the original object
// Only the object itself and any properties with primitive values are duplicated
// Properties that are objects are copied by reference; only a pointer to the object is copied
