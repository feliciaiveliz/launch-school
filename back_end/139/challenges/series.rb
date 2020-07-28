=begin
input: number string
output: array of subarrays that contains sections of 'number' specified by a section
algo:
- convert string to integer
- call #digits and #reverse 
- call #each_cons on the number to generate the array of subarrays
=end

class Series
  def initialize(series)
    @series = series.chars.map(&:to_i)
  end

  def slices(number)
    raise ArgumentError if number > @series.size
    @series.each_cons(number).to_a
  end
end
