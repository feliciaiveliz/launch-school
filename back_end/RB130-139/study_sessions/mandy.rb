

# Block -> Proc
def test(name, &monkey)
  puts "What's &block? #{name} #{monkey}"
  why_do_we_need_proc(monkey)
end

def why_do_we_need_proc(random)
  third_method(random)
end

def third_method(random2)
  random2.call
  random2.call
  random2.call
end

test("Felicia") { puts "this is monkey" }

{ puts "this is monkey" }
monkey --> Proc.new( {puts "this is monkey" } )
           ^ 
random ----|

random.call --> puts "this is monkey"


a = 'hi'
b = a

def test2(name)
  puts "What's &block? #{name}"
  yield
end
test2("Felicia") { puts "this is a block" }

# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil

# Implicit
def sequence(total_nums, first_num, factor)
  # i = 0
  # while(i < total_nums)
  #   yield(first_num + i * factor)
  #   i += 1
  # end
end

# Explicit
def sequence(&programmer_defined_steps, total_nums, first_num, factor)
  # i = 0
  # while(i < total_nums)
  #   programmer_defined_steps.call(first_num + i * factor)
  #   i += 1
  # end
end


# Implicit:

sequence(5, 2, 2) { |x| puts x } # => Print numbers 2, 4, 6, 8, 10

# Explicit:

sequence(5, 2, 2) { |x| puts x } # => Print numbers 2, 4, 6, 8, 10