let destinations = ['Prague', 'London', 'Sydney', 'Belfast', 'Rome',
  'Aruba', 'Paris', 'Bora Bora', 'Barcelona', 'Rio de Janeiro',
  'Marrakesh', 'New York City'];

function isIncluded(array) {
  for (let i = 0; i < destinations.length; i++) {
    if (destinations[i] === 'St. Croix') {
      return true;
    }
  }
  return false;
}

// LS

function isIncluded(place, array) {
  for (let i = 0; i < array.length; i++) {
    if (list[i] === place) {
      return true;
    }
  }
  return false
}

console.log(isIncluded('St. Croix', destinations));
