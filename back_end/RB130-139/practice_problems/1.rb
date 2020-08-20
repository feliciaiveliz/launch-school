# What does this return, and why?

"hi".upcase { |el| el + "!!!!!" }

# This returns a new string object 'HI' because the #upcase method being called on 'hi' returns a new string object; it does not modify the original object.
# All methods take an implicit block but in this case, #upcase does not take blocks for arguments, so the block is ignored.