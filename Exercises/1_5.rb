

=begin
=end
ALPHA_L = ('a'..'z').to_a
ALPHA_U = ('A'..'Z').to_a

def rot13(string)
  result = ''
  string.each_char { |letter| result << decipher(letter) }
  result
end

def decipher(char)
  if ALPHA_L.include?(char)
    letter = (ALPHA_L.index(char) + 13) % 26
    ALPHA_L[letter]
  elsif ALPHA_U.include?(char)
    letter = (ALPHA_U.index(char) + 13) % 26
    ALPHA_U[letter]
  else
    char
  end
end 

p rot13 'Nqn Ybirynpr'
p rot13 'Nqn Ybirynpr'
p rot13 'Tenpr Ubccre'
p rot13 'Nqryr Tbyqfgvar'
p rot13 'Nyna Ghevat'
p rot13 'Puneyrf Onoontr'
p rot13 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv'
p rot13 'Wbua Ngnanfbss'
p rot13 'Ybvf Unvog'
p rot13 'Pynhqr Funaaba'
p rot13 'Fgrir Wbof'
p rot13 'Ovyy Tngrf'
p rot13 'Gvz Orearef-Yrr'
p rot13 'Fgrir Jbmavnx'
p rot13 'Xbaenq Mhfr'
p rot13 'Fve Nagbal Ubner'
p rot13 'Zneiva Zvafxl'
p rot13 'Lhxvuveb Zngfhzbgb'
p rot13 'Unllvz Fybavzfxv'
p rot13 'Tregehqr Oynapu'

=begin



=end







