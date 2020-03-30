# def two_sum(arr, target)
#   test = []
#   arr.each_with_index do |num, idx|
#     idx2 = idx + 1
#     loop do
#       test << arr[idx] << arr[idx2]
#       test.sum == target ? (return [idx, idx2]) : test.clear
#       idx2 += 1
#       break if idx2 > arr.size - 1
#     end
#   end
# end

def solution(str)
  return [] if str.empty?
  result = []
  
  until str.empty?
    result << str.slice!(0, 2)
  end
  
  result[-1].size == 1 ? result[-1] << "_" : result[-1]
  result
end

=begin

input: string
output: array of string pairs
problem:
- create an empty array
- slice out two letters and add to array until string is empty
- if the last string in the array is size 1, add underscore to last string
ALGORITHM:
- initialize 'result' to []
- until str is empty:
  - add to result: str.slice(0, 2)
- given 'result':
  - if last element (str) is str size 1, add "_" to result[-1]
- return result
=end