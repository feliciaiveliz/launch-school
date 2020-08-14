my_hash = { name: 'Felicia', age: 24, birthplace: "St. Croix" }

my_hash.each_key { |key| puts key } # keys
my_hash.each_value { |value| puts value } # values 
my_hash.each { |key, value| puts key, value } # both