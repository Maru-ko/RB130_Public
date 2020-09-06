# frozen_string_literal: true

#
# Secret Handshake
#
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
#
#
# 10000 = Reverse the order of the operations in the secret handshake.
#
# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]
#
# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
#
# 11111
# 10000
#  1000
#   100
#    10
#     1
class SecretHandshake
  VALUES =  [1, 10, 100, 1000].freeze
  LASERBEAM = { 1 => 'wink',
                10 => 'double blink',
                100 => 'close your eyes',
                1000 => 'jump' }.freeze

  def initialize(input)
    @input = input
  end

  def commands
    main_key = format_input
    result = money_maker(main_key)
    ready = result.map.with_index { |n, idx| LASERBEAM[n * VALUES[idx]] } - [nil]
    main_key >= 10_000 ? ready.reverse : ready
  end

  private

  attr_reader :input

  def format_input
    if input.instance_of?(Integer)
      input.to_s(2).to_i
    else
      input.to_i(2)
    end
  end

  def money_maker(key)
    result = []
    while key.positive?
      key, rem = key.divmod(10)
      result << rem
    end
    result.first(4)
  end
end
