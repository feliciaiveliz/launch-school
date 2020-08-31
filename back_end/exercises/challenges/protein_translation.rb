=begin

input: string codon or rna strand 
output: string protein
problem:
- translate the codon or rna strand to a protein
- if there's a stop codon, terminate translation and don't include last protein
- return an exception if input is invalid
algorithm:
- initialize 'PROTEINS' to {}
  - keys: array of codons as string
  - values: proteins or STOP
- define 'of_codon(codon)' class method: 
  - iterate over PROTEINS and pass in the array of codons
    - if 'codon' is included in 'codons_array'
      - return 'protein'
    - if it's a string of proteins
      - save each string value into array
      - invoke #uniq to get rid of duplicates
- define 'of_rna(strand)' class method
  - initialize 'codons' to []
  - initialize 'proteins' to []
  - until the strand is empty?
    - slice! out 3 letter sequences of strand
    - put each sequence into 'codons'
  - use #each to iterate over 'codons' array and 'proteins' hash
  - push the 'protein' to 'proteins' if hash codons_array includes the codon
  - after iteration:
    - 
- raise InvalidCodonError, 'Input is not a valid codon' if input is not a codon
=end

class InvalidCodonError < StandardError; end

PROTEINS = { 
  %w(AUG) => 'Methionine',
  %w(UUU UUC) => 'Phenylalanine',
  %w(UUA UUG) => 'Leucine',
  %w(UCU UCC UCA UCG) => 'Serine',
  %w(UAU UAC) => 'Tyrosine',
  %w(UGU UGC) => 'Cysteine',
  %w(UGG) => 'Tryptophan',
  %w(UAA UAG UGA) => 'STOP'
}

# class Translation
#   def self.of_codon(input_codon)
#     PROTEINS.each do |codon, protein|
#       return protein if codon.include?(input_codon)
#     end
#   end

#   def self.of_rna(strand)
#     raise InvalidCodonError if strand =~ /[^ACGU]/

#     codons = []
#     proteins = [] 
#     stop_codon = 0

#     until strand.empty?
#       codons << strand.slice!(0, 3)
#     end

#     codons.each do |codon|
#       PROTEINS.each do |codon_array, protein|
#         proteins << protein if codon_array.include?(codon)
#       end
#     end

#     if proteins.include?('STOP')
#       stop_codon = proteins.index('STOP')
#       proteins.slice!(stop_codon..-1)
#     end

#     proteins
#   end
# end

