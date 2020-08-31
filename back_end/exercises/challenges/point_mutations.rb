class DNA
  def initialize(strand)
    @strand = strand.chars
    @strand_copy = strand.clone
  end

  # def hamming_distance(other_strand)
  #   if @strand.size > other_strand.size
  #     @strand = other_strand.chars
  #     other_strand = @strand_copy
  #   end

  #   count = 0
  #   other_strand = other_strand.chars
  #   @strand.each_with_index do |letter, index|
  #     next if letter == '' || other_strand[index] == ''
  #     count += 1 if letter != other_strand[index]
  #   end
  #   count
  # end
  
  def hamming_distance(other_strand)
    @strand.zip(other_strand.chars).select { |array| array.none?(nil) }.count { |a1, a2| a1 != a2 }
  end
end