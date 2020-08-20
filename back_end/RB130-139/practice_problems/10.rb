# What will be output and returned here?

def true_or_false(&block) 
  puts "The block is #{yield if block_given?}"
end

true_or_false { 5 < 8 } 