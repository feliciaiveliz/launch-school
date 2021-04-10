let fish = ['Dory', 'Marlin', 'Gill', 'Nemo', 'Bruce'];
counter = 0

while (fish[counter] != 'Bruce') {
  console.log(fish[counter]);
  counter += 1;
}

for (i = 0; i < fish.length; i += 1) {
  console.log(fish[i]);

  if (fish[i] === 'Nemo') {
    break;
  }
}
