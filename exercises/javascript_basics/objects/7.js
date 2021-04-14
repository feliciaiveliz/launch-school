let vehicle = {
  manufacturer: 'Tesla',
  model: 'Model X',
  year: 2015,
  range: 295,
  seats: 7
};

let keys = Object.keys(vehicle);

let keys = [];
for (let property in vehicle) {
  keys.push(property);
}

console.log(keys);
