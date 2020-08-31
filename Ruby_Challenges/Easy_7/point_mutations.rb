=begin

Calculate the Hamming distance between two DNA strands.

Although mutations are techincally mistakes, very rare mutation may equip the cell witha beneficial attribute.

Most common type of nucleic acid mutation is a **point mutation**
which replaces one base with another at a single nucleotide.



the hamming sequence is only defined for dequences of equal length

if two sequences are of unequal length, comput distance over the shorter length


Distance is 19
    strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
  distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'

Distance is 5
    strand = 'GACTACGGACAGGGTAGGGAAT'
  distance = 'GACATCGCACACC'
                 ^^  ^   ^^


Lets choose which one is larger in length, if they are the same lenght lets continue

    #strnd, dstns = strand.size, distance.size
    #fiesta = strnd == dstns ? strnd : strnd > dstns ? dstns : strnd
    #fiesta - 1
=end             



class DNA
  attr_reader :strand, :other_strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    @other_strand = other_strand
    max_size = determine_shortest_strand

    (0..max_size).reject { |idx| strand[idx] == other_strand[idx] }.count
  end

  private :strand, :other_strand

  def determine_shortest_strand
    [strand.size, other_strand.size].min - 1
  end
end

# # strand = 'GACTACGGACAGGGTAGGGAAT'
# # distance = 'GACATCGCACACC'

# strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
# distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'

# dna = DNA.new(strand)

# p dna.strand
# p dna.hamming_distance(distance)
# p dna.distance