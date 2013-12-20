require 'csv'
require 'pry'

class CodonParser

  def codon_hash
    codon_hash = {}
    CSV.foreach("codon_test2.csv") do |row|
      n=row.length
      i= 0
      while i < n
        codon_hash[row[i+1]] = row[0] if row[i+1]
        i+=1
      end
    end
    codon_hash
  end


end

CodonParser.new.codon_hash