def find_all(arr, n)
  array = []
  arr.find_index do |num|
    array << num if num == n
    end
  array
end

p find_all([6, 9, 3, 4, 3, 82, 6], 3)