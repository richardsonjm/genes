####A basic tool for sequencing a string of nucleotides


To use application, clone repository

`git clone git@github.com:richardsonjm/genes.git`

cd into `genes` directory and run `ruby cli.rb` from the command line.


#######Application files

`codon.csv` represents a table of amino acids and their respective codons which originated from [here](http://www.cbs.dtu.dk/courses/27619/codon.html).

`codon_parser.rb` loads the values from `codon.csv` into a hash.

`gene_sequencer.rb` splits the string of nucleotides into the potential sets of codons and then matches them with the respective amino acids from the amino_acid_hash.

`seqencer_cli.rb` turns the code from `gene_sequencer.rb` into a command line interface.

`cli.rb` initiates the commmand line interface.

