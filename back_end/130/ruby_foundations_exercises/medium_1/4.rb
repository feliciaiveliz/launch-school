# Passing Parameters Part 2

# birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']

# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven
# p finch
# p raptors

def birds(array)
  yield(array.last(2))
end

birds = %w(raven finch hawk eagle)

def types(birds)
  yield(birds)
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end

birds(%w(raven finch hawk eagle)) { |bird| puts "Raptops: #{bird.join(', ')}" }
