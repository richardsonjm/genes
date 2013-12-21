require 'pry'
require 'numbers_and_words'
require_relative './codon_parser.rb'

class GeneSequencer

  attr_accessor :parser

  def initialize(sequence)
    @array = sequence.upcase.split("")
    @protein_hash = {}
    if @array.length > 2
      sequencer
      puts @protein_hash
    else
      puts "codon to small to parse"
    end
  end

  def sequencer
    parser(@array)
    parser(@array.reverse, :reverse)
  end

  def parser(array, dir=:forward )
    i = 0
    while i < 3
      genes = tripler(array[i..-1])
      if dir==:forward
        @protein_hash[i.to_words.to_sym] = protein_matcher(genes)
      else
        @protein_hash[("r_"+ i.to_words).to_sym] = protein_matcher(genes)
      end
      i += 1
    end
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
    proteins = []
    genes.each do |gene|
      break if codon_hash[gene] == "Stop codons"
      proteins << codon_hash[gene]
    end
    proteins
  end

end

puts GeneSequencer.new("ttc").sequencer

