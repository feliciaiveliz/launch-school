# Study Session with Anna Kolliakou and Megan Turley

# Problem 1: Highest Scoring Word => Codewars | 6 kyu

# Given a string of words, you need to find the highest scoring word.
# Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.
# You need to return the highest scoring word as a string.
# If two words score the same, return the word that appears earliest in the original string.
# All letters will be lowercase and all inputs will be valid.

# p high('man i need a taxi up to ubud') == 'taxi'
# p high('what time are we climbing up the volcano') == 'volcano'
# p high('take me to semynak') == 'semynak'
# p high('aaa b') == 'aaa'

# Problem 2: Sum Consecutives => Codewars | 6 kyu

# You are given a list/array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one list.
# Same meaning: 1 == 1
# 1 != -1

# p sum_consecutives([1,4,4,4,0,4,3,3,1]) == [1,12,0,4,6,1]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]

# The questions require explanations that are explained with a high level of precision. Don't use too many words and make sure you are precise. 
# Things that are important to explain: the return value of an expression, if there are side effects, if something is being outputted nad if there are new objects being created or not.
# Things that are a must know:
# local variable scoping rules
# difference between truthiness and true/false
# Variable shadowing
# Answer the questions first and then if you have time, go back and explain things further.
# Are local variables available to method definitions? Only if they are passed in as variables
# Method defintions are self-contained with respect to local variables
# reassignment of variables
# Variables as pointers
# One thing that tripped me up: += two seperate things going on
  # + is a method call and when used with two strings is concatenation
  # this returns a new string object
  # = is reassignment (or assignment). 
# Be able to explain clearly the difference of each, map and select
# Use number lines to reference specific lines of code
# use markdown for everything
# use cheatsheet

greeting = "Hello"

loop do 
  greeting = "Hi"
  break
end

puts greeting

def a_method
  puts "hello world"
end

# Difference between 'output' and 'return'

a = "Hello"

if a 
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end

