let names = ['Eunice', 'Lucas', 'Mariana'];
names.forEach((name, index, array) => console.log(name, index, array[index]));

function myForEach(array, func) {
  for (let i = 0; i < array.length; i += 1) {
    func(array[i], i, array);
  }
