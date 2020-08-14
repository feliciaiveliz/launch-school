def men_from_boys(arr)
  men_boys = arr.partition { |n| n.even? }
  men = []
  men << men_boys[0]
  men.sort_by { |a, b| a <=> b }
  
  boys = []
  boys << men_boys[1]
  boys.map { |boy| boy.sort! { |a, b| b <=> a } }
  final = (men + boys).flatten.uniq
  final
end

p men_from_boys([7, 3, 14, 17])
p men_from_boys([2, 43, 95, 90, 37])