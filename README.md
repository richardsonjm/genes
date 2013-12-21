####A basic tool for sequencing a string of nucleotides

`codon.csv` represents a table of amino acids and their respective codons which originated from [here](http://www.cbs.dtu.dk/courses/27619/codon.html).

`codon_parser.rb` loads the values from `codon.csv` into a hash.

`gene_sequencer.rb` splits the string of nucleotides into the potential sets of three and then matches them with the respective amino acids from the amino_acid_hash.

