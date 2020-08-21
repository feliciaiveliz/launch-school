items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |food| puts food.map(&:capitalize).join('! ') }
gather(items) { |food| puts "We've gathered some vegetables: #{food[1]} and #{food[2]}" }
