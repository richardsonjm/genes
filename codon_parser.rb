require_relative './environment.rb'

class CodonParser

  def codon_hash
    codon_hash = {}
    CSV.foreach("codon.csv") do |row|
      n=row.length
      i= 0
      while i < n
        codon_hash[row[i+1].strip] = row[0] if row[i+1]
        i+=1
      end
    end
    codon_hash
  end
end
