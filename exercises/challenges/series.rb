# input: string number
# output: array of subarrays that contains sections of sliced number
# problem:
# - slice string number into sections specified by 'number'
# - return each section as a subarray within a larger array
# algorithm:
# - split series into an array of chars using #chars
# - convert each string into an integer using #map and #to_i
# - define 'slices'
# - raise an Argument error if the number is bigger than the 'series'
# - invoke #each_cons and pass in 'number' to specify size
# - invoke #to_a to convert enumerator to an array
# - return result
class Series
  def initialize(series)
    @series = series.chars.map(&:to_i)
  end

  def slices(number)
    raise ArgumentError if number > @series.size

    @series.each_cons(number).to_a
  end
end
