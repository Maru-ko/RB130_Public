# frozen_string_literal: true

# Protein Translation

class InvalidCodonError < StandardError
end

class Translation
  CODONS = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
             'UUC' => 'Phenylalanine',
             'UUA' => 'Leucine', 'UUG' => 'Leucine', 'UCU' => 'Serine',
             'UCC' => 'Serine', 'UCA' => 'Serine',
             'UCG' => 'Serine', 'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
             'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
             'UGG' => 'Tryptophan', 'UAA' => 'STOP', 'UAG' => 'STOP',
             'UGA' => 'STOP' }.freeze

  def self.of_codon(codon)
    CODONS[codon]
  end

  def self.of_rna(strand)
    stop = false
    strand.chars.each_slice(3).map do |codon|
      the_codon = of_codon(codon.join)

      raise InvalidCodonError unless !!the_codon

      stop = true if the_codon == 'STOP'
      next if stop

      the_codon
    end - [nil]
  end
end
# strand = 'UGGUGUUAUUAAUGGUUU'
# #expected = %w(Tryptophan Cysteine Tyrosine)
# p Translation.of_rna(strand)
