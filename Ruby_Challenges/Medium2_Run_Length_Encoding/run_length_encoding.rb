class RunLengthEncoding
  def self.encode(input)
    return input if input.include?(' ')
    result = ''
    pocket = []
    input.each_char.with_index do |char, idx|
      if idx == 0
        pocket << char
      elsif idx == input.size - 1 && pocket.last == char
        pocket << char
        ps = pocket.size
        size = ps == 0 ? '' : ps == 1 ? '' : ps
        result << [size, char].join
      elsif idx == input.size - 1 && pocket.empty?
        result << pocket.last
      elsif pocket.last == char
        pocket << char
      elsif pocket.last != char
        ps = pocket.size
        size = ps == 0 ? '' : ps == 1 ? '' : ps
        result << [size, pocket.last].join
        pocket = []
        pocket << char
        result << char if idx == input.size - 1
      end
    end
    result
  end

  def self.decode(input)
    return input if input.include?(' ')
    input.scan(/\d{1,}.{1}|.{1}/)
         .map do |set|
      core = set.scan(/\d+|./)
      core.size > 1 ? (core[1] * core[0].to_i) : core[0]
    end.join
  end
end
