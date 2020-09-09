class Diamond
  ALPHA = ('A'..'Z').to_a

  def self.make_diamond(letter)
    max = ALPHA.index(letter)
    magic = max * 2 + 1
    magic_arr = (1..magic).select(&:odd?)
    result = looper(max, magic, magic_arr)
    (result + result.reverse[1..-1]).join("\n") + "\n"
  end

  def self.looper(max, magic, magic_arr)
    (0..max).map do |idx|
      char = ALPHA[idx]
      char = idx == 0 ? char : char * 2
      spacer = magic_arr[idx - 1]
      char.chars.join((' ' * spacer)).center(magic)
    end
  end
end
