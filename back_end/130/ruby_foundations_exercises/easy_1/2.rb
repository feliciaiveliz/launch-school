# Optional Blocks

def compute
  block_given? ? yield : "Does not compute"
end

def compute
  return 'Does not compute' unless block_given?
  yield
end

p compute { 5 + 3 } #== 8
p compute { 'a' + 'b' } #== 'ab'
p compute #== 'Does not compute.'

# Further Exploration

def compute(something)
  yield(something) if block_given?
  something
end

p compute("Howdy") { |str| str }
p compute(7) { |n| n * n }
p compute([1, 2, 3])