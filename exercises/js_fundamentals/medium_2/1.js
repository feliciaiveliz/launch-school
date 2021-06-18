function processOrder(price, quantity, discount, serviceCharge, tax) {
  if (!quantity) {
    quantity = 1;
  }

  if (!discount) {
    discount = 0;
  }

  if (!serviceCharge) {
    serviceCharge = 0.1;
  }

  if (!tax) {
    tax = 0.15;
  }

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

processOrder(100);      // 126.5

function processOrder(price, quantity, discount, serviceCharge, tax) {
  quantity = quantity || 1;
  discount = discount || 0;
  serviceCharge = serviceCharge || 0.1;
  tax = tax || 0.15;

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

// For example 1, it adds plenty of extra lines of code to write out condition statements to check whether a value is supplied for a parameter.
// For example 2, if there happens to be a value of 0, that could cause errors when try to compare 0 || 1.
// It would be beneficial to make use of default parameters.
// Set the value of the parameters where they are defined in a function.
// It can be done all on one line and it makes it easier to read from a glance what the values of the parameters are.

function processOrder(price, quantity = 1, discount = 0, serviceCharge = 0.1, tax = 0.15) {
  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}
