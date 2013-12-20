require 'pry'

class GeneSequencer

  attr_accessor :parser

  def initialize(sequence)
    @array = sequence.split("")
    @reverse_array = @array.reverse
    if @array.length > 4
      parser
    else
      @array + @reverse_array
    end
  end

  def parser
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

end

puts GeneSequencer.new("ttctaatgc").parser

