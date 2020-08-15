# The output of the code below tells you that you have around $70. However, you expected your bank account to have about $238. What did we do wrong?

# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ], # 1275
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ] # 1028.10
}

february = {
  income: [ 1200 ], # 1200
  expenses: [ 650, 140, 320, 46.7, 122.5 ] # 1279.20
}

march = {
  income: [ 1200, 10, 75 ], # 1285
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ] # 1214.40
}

def calculate_balance(month)
  plus  = month[:income].sum # 3760
  minus = month[:expenses].sum # 3521.70

  plus - minus # 238.30
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts balance