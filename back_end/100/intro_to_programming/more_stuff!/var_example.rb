# b is assigned to a, which is then assigned to "hi there."
a = "hi there"
b = a
a = "not here"

# a and b are now assigned to "hi there Vin."
a = "hi there"
b = a
a << ", Vin"


