// Write a Function named processReleaseData that processes the following movie release data:
// The Function should generate an Array of Objects that contain only the id and title key/value pairs. You may assume that id and title, when existing, is an integer greater than 0 and non-empty string respectively. Here are the rules:
// Keep only releases that have both id and title property present.
// Keep only the id and title data for each release.

/*
input: array of objects that contain data for a movie releases
output: new array of objects that contain only movies that have an id and title key/value pairs
rules:
- only objects that have id and title can be key/value pairs
- id number > 0
- title != ''
algorithm:
- Use filter() to iterate over array of objects:
  - select only objs that contain 'id' > 0 and title that's not equal to ''
- Use map() to transform remaining elements into an array of objs:
  - map the elements into 'id' => (number) and 'title' => (string)
- Return transformed array
*/

let newReleases = [
  {
    'id': 7011140,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];

function processReleaseData(data) {
  data = data.filter(release => release.id && release.title);
  return data.map(release => { return { id: release.id, title: release.title, }; });
}

console.log(processReleaseData(newReleases));

// Further Exploration

// The current solution assumes that the value of id will be an integer value greater than 0. If it was possible to have a value of 0 for id, what would the implications be to the current solution? What changes, if any, would need to be made in order to handle the 0 value?

// The current solution uses && to compare both the id and title of a movie release. It relies on the fact an id will not be 0, which is a falsey value. Only if both the id and title are truthy will the movie release be selected.
// In order to make sure that the filter method selects titles that can include 0, we need to

function processReleaseData(data) {
  data = data.filter(release => ((release.id >= 0) && release.title));
  return data.map(release => { return { id: release.id, title: release.title, }; });
}

console.log(processReleaseData(newReleases));
