=begin

Write a method that takes two arguments, multiplies them together, and returns the result.

Input: two integers 

Outputs: returned result of multiplication 

Rules/Requirements: numbers could be either positive or negative

Algorithm: 
- define multiply method that takes two params (num1, num2)
- inside method num1 * num2
- end method
- call method with two number arguments
=end

def multiply(num1, num2)
  num1 * num2
end

p multiply(7, 2)      # 14
p multiply(-3, 5)     # -15
p multiply([4], 2)    # [4, 4]
p multiply([4], [2])  # no implicit conversion of Array into Integer (TypeError)




