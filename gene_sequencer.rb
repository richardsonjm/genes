require 'pry'
require_relative './codon_parser.rb'

class GeneSequencer

  attr_accessor :parser

  def initialize(sequence)
    @array = sequence.upcase.split("")
    @reverse_array = @array.reverse
    if @array.length > 4
      parser
    else
      @array + @reverse_array
    end
  end

  def sequence_parser
    genes = []
    genes.concat(tripler(@array))
    genes.concat(tripler(plus_one(@array)))
    genes.concat(tripler(plus_two(@array)))
    genes.concat(tripler(@reverse_array))
    genes.concat(tripler(plus_one(@reverse_array)))
    genes.concat(tripler(plus_two(@reverse_array)))
    genes
  end

  def tripler(array)
    n=0
    triples = []
    while n < array.length
      triples << array[n..(n+2)].join if array[n..(n+2)].size==3
      n+=3
    end
    triples
  end

  def plus_one(array)
    shifted_array = array[1..-1]
  end

  def plus_two(array)
    double_shifted_array = array[2..-1]
  end

  def protein_matcher
    codon_hash = CodonParser.new.codon_hash
    proteins = sequence_parser.collect do |gene|
      codon_hash[gene]
    end
  end

end

puts GeneSequencer.new("ttctaatgc").protein_matcher

