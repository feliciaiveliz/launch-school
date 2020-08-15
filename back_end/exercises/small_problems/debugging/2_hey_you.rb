=begin

String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? Modify the code so that it produces the expected output.

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
=end

def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }.join # chars returns a new array, so we can assign that array back to name, and join it back into a string

  puts 'HEY ' + name
end

p shout_out_to('you') # expected: 'HEY YOU'


def shout_out_to(name)
  name.upcase!   # this simply mutates the variable itself
  
  puts 'HEY ' + name
end

p shout_out_to('you')