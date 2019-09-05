names = ['Vin', 'Felicia', 'Gian', 'Kayla', 'Bobby']

# Original
names.each { |name| puts name }

# Added functionality; this will create a numbered list.

names = ['Vin', 'Felicia', 'Gian', 'Kayla', 'Bobby']
x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end


