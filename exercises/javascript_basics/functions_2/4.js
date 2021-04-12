function calculateBMI(height, weight) {
  let heightInMeters = height / 100;
  let bmi = weight / heightInMeters ** 2;
  return String(bmi.toFixed(2));
}

console.log(calculateBMI(180, 80));
