let energy = ['fossil', 'solar', 'wind', 'tidal', 'fusion'];

energy.shift();
energy.push('geothermal');

// or

energy = energy.slice(0);

console.log(energy);
