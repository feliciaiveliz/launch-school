# odd? method is used to decide if the variable in loop is odd, then prints it if it is. 
x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end


# conditional_while_loop_with_next.rb
# next will skip to the next loop iteration without executing the code beneath.
x = 0

while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end


# conditional_while_loop_with_break.rb

x = 0

while x <= 10
  if x == 7
    break
  elsif x.odd?
    puts x
  end
  x += 1
end

