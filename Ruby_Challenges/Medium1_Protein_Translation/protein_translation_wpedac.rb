#Protein Translation

class InvalidCodonError < StandardError
end

class Translation
CONVERSION = {"AUG"=>"Methionine", "UUU"=>"Phenylalanine", "UUC"=>"Phenylalanine", 
  "UUA"=>"Leucine", "UUG"=>"Leucine", "UCU"=>"Serine", "UCC"=>"Serine", "UCA"=>"Serine", 
  "UCG"=>"Serine", "UAU"=>"Tyrosine", "UAC"=>"Tyrosine", "UGU"=>"Cysteine", "UGC"=>"Cysteine", 
  "UGG"=>"Tryptophan", "UAA"=>"STOP", "UAG"=>"STOP", "UGA"=>"STOP"}


  def self.of_codon(codon)
    CONVERSION[codon]
  end

  def self.of_rna(strand)
    result = []
    go = false
    strand.chars.each_slice(3).each do |codon|
      the_codon = CONVERSION[codon.join]

      raise InvalidCodonError unless !!the_codon
      
      go = true if the_codon == 'STOP'
      next if go
      result << the_codon
   end
    result#.join(' ')
  end
end


=begin



Error that needs to be raised: InvalidCodonError if the system does not contain key given

convoluted hash is best

we can get a specific key by using the `#key` method

We can build a hash and reference the values to get the key


first we need to retrieve the keys

then we need to translate a string into codons


{ Methionine => ["AUG"]
Phenylalanine => ["UUU", "UUC"]
Leucine => ["UUA", "UUG"]
Serine => ["UCU", "UCC", "UCA", "UCG"]
Tyrosine => ["UAU", "UAC"]
Cysteine => ["UGU", "UGC"]
Tryptophan => ["UGG"]
STOP => ["UAA", "UAG", "UGA"] }

quickly convert all these to a normal hash
CONVERSION.each_with_object({}) { |(k, v), hsh| v.each { |codon| hsh[codon] = k} }

{"AUG"=>"Methionine", "UUU"=>"Phenylalanine", "UUC"=>"Phenylalanine", "UUA"=>"Leucine", "UUG"=>"Leucine", "UCU"=>"Serine", "UCC"=>"Serine", "UCA"=>"Serine", "UCG"=>"Serine", "UAU"=>"Tyrosine", "UAC"=>"Tyrosine", "UGU"=>"Cysteine", "UGC"=>"Cysteine", "UGG"=>"Tryptophan", "UAA"=>"STOP", "UAG"=>"STOP", "UGA"=>"STOP"}

=end