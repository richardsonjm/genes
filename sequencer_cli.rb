require_relative './environment.rb'

class SequencerCLI

  APPROVED_COMMANDS = [:sequence, :help, :exit]

  NUM_ARRAY = ["Baseline", "Plus_one", "Plus_two"]

  def initialize
    @on = true
  end

  def on?
    @on
  end

  def call
    choice = ''
    while on?
      while !APPROVED_COMMANDS.include?(choice)
        puts "Type command (sequence, help, or exit):"
        choice = gets.chomp.strip.downcase.to_sym
      end

      self.send(choice)
      choice = ''
    end
  end

  def sequence
    puts "please enter list if nucleotides to be sequenced"
    sequence = gets.chomp.strip.downcase
    @array = sequence.upcase.split("")
    @amino_acid_hash = {}
    if @array.length > 2
      sequencer
      printer
    else
      puts "codon to small to parse"
    end
  end

  def help
    puts "Instructions. Type:"
    puts "-------------------------"
    puts "'help' to see this list of commands"
    puts "'sequence' to and enter a list of nucleotides as a string"
    puts "-- for example 'gattaca' --"
    puts "'exit' to exit."
    puts "-------------------------"
    puts 
  end

  def exit
    puts "Goodbye"
    @on = false
  end

  def sequencer
    parser(@array)
    parser(@array.reverse, :reverse)
  end

  def parser(array, dir=:forward )
    i = 0
    n = 0
    while i < 3 && n < array.length
      genes = tripler(array[i..-1])
      if dir==:forward
        @amino_acid_hash[NUM_ARRAY[i].to_sym] = protein_matcher(genes)
      else
        @amino_acid_hash[("r_"+ NUM_ARRAY[i]).to_sym] = protein_matcher(genes)
      end
      i += 1
      n += 3
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

  def printer
    puts "-----"
    @amino_acid_hash.each do |key, value|
      if value != []
        puts "#{key}:"
        puts value
        puts "-----"
      end
    end
  end
end
