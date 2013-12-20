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
    zero_parser(@array)
  end

  def zero_parser(array)
    genes = tripler(array)
    proteins = protein_matcher(genes)
    [genes, proteins]
  end

  def plus_one_parser(array)
    genes = tripler(array[1..-1])
    proteins = protein_matcher(genes)
    [genes, proteins]
  end

  def plus_two_parser(array)
    genes = tripler(array[2..-1])
    proteins = protein_matcher(genes)
    [genes, proteins]
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


  def protein_matcher(genes)
    codon_hash = CodonParser.new.codon_hash
    proteins = genes.collect do |gene|
      while codon_hash[gene] != 'Stop codon'
        codon_hash[gene]
      end
    end
  end

end

puts GeneSequencer.new("ttctaatgc").sequence_parser

