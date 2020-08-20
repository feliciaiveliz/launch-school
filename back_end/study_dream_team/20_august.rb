=begin
Last question:
- Problem - Test Cases - Minitest 
Types of Questions
- conceptual questions you have to explain
- explain what's happening with code snippets
=end

=begin

Test Preparations

What is a closure? 
- A closure is a general programming concept that allows a programmer to pass around a 'chunk of code' that can be executed at a later time.
You can think of a closure as an unnamed block of code. A closure creates a binding, which is an enclosure that retains access to variables, methods and any other data that was in scope at the time of the closures creation.
Closures in ruby are implemented through blocks, procs and lambdas.

Can you return explicitly from a block?
- No, you can only return from a method definitions but not from blocks.

# What is arity?

Arity dictates the number of arguments you can pass to a block. A block can specify the number of block parameters but Ruby hasn't lenient arity rules, so it won't throw an error if you pass in fewer more more arguments to the block.
Ruby treats any extra arguments as having a 'nil' value.

=begin
0. Last question
0.1 Types of questions 
1. Various theory questions - Written Format
2. Packaging code, L3
3. Testing, L2
  assert(test)
  assert_equal(exp, act)
  assert_nil(obj)
  assert_raises(*exp) { ... }
  assert_includes(collection, obj)
4. Richard's question 
=end





#RM:  Arity is the strictness in relation to argument and parameter ratio. lambdas and methods have strict ratio of arguments and parameters. procs and blocks have less stirct rules parameter to argument ratio.


# rules regarding no.args that one can pass to a proc/lambda/block in ruby is arity.
# bocks don't enforce argument count, unlike normal methods/blocks have very lenient ARITY rules.

# Felicia: Arity dictates the number of arguments you can pass to a block. A block can specify the number of block parameters but Ruby has lenient arity rules, so it won't throw an error if you pass in fewer or more arguments to the block.
# Ruby treats any extra arguments as having a 'nil' value.


# Laura: Describes the rules regarding the number of arguments that can be passed into blocks, Procs and lambdas. Ruby has lenient arity rules for blocks.



# Keywords: strictness of arguments, lenient arity


# block with more and less argument 

# def a_method
#   yield('hello', 'goodbye')
# end


# a_method do |a| 
#   puts a
# end 

  


exception 'TooManyArguemtns

#   assert(test) # pass if arg is truthy
#   assert_equal(exp, act) #expected value to be returned by test, and the actual RV of test
#    #== 

#   assert_same(exp, act) #checks to see if the two objects are the same, #equal?
  
#   assert_nil(obj) #nil 


#   assert_raises(*exp) { ... } #exception NoMethodError

#   # test version of exception
#   assert_raises(NoMethodError) do
#     my_instance.method
#   end

  # method version of execption
  def say_hi(greeting)
    # wrong arguments passed in :(
    
    raise ArgumentError, 'wrong arguments passed in :(' if block_given?
    puts greeting
  end

  p say_hi('hi') { 'hi'}

#   assert_includes(collection, obj)









=begin
#1. What is a closure ? 
RM - A closure is a 'chunk of code' that can be saved to be executed at a later time. They create an 'enclosure' and in which they bind to the surrounding artifacts (e.g. local variables, methods, objects etc). Closures bind to objects in the scope in which they are defined. They can be lambdas, procs and blocks.


Marcos - a closure is a ruby programming concept that allows programmers to save a chunk of code to be executed at a later time, it is a closure because it binds its surrounding artifacts and encloses them whole to be referenced later when executing the closure. Basically a method that you pass around and execute with no explicit name definition.
There are three ways to implement closure’s in ruby Proc object, lambda, block.  Binding - This chunk of code retains references to its surrounding artifacts
refer implementation for method invocation - sandwhich code

Laura: A "chunk of code" that isn't defined with a specific name. The closure takes everything that is in scope at the time of initialization (e.g. local variables, methods, instance variables) and encloses them so they can be referenced later. 
Ruby implements closures with blocks, lambdas and Proc objects. Closures can be passed around between methods.

Felicia: A closure is a general programming concept that allows a programmer to pass around a 'chunk of code' that can be executed at a later time.
You can think of a closure as an unnamed block of code. A closure creates a binding, which is an enclosure that retains access to variables, methods and any other data that was in scope at the time of the closures creation.
Closures in ruby are implemented through blocks, procs and lambdas.


chunk of code 
save / executed later 
like a method, without explcit name
can be passed around
enclosure, binding surrounding artifacts 
3 ways to do them in Ruby: lambdas, procs and blocks

main uses: generic, before and after 

=end


# 5.times do |n|
#   puts n
#   return n
# end 

# def method
#   5.times do |n|
#     puts n
#   end 
# end 

# method

# def call_me(some_code)
#   some_code.call
# end

# name = 'Robert'
# chunk_of_code = Proc.new { puts "hi #{name}" }

# name = "joe"

# call_me(chunk_of_code)

# MYCONSTANT = [1,2,3,4,5]

# x = 'eating'

# def this_method(apple='anything')
#   apple = 'hi'
# end

# new_local = Proc.new { 'hi' } # what is in it's binding 

# y = 'happy var'

# OTHER_CONSTANT = 'string constant'



# def true_or_false(&block) 
#   puts "The block is #{yield if block_given?}"
# end

# true_or_false { 5 < 8 } 