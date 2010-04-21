require "rational"

class FractionParser

  def self.parse(string)
    string = string.strip
    if string =~ /^((\d+)\s+)?((\d+)\/(\d+))$/
      sum = Rational($4.to_i, $5.to_i)
      sum += $2.to_i if $2
      sum
    else
      sum = self.float_to_rational(string.to_f)
    end
  end

  # Whoa this method is crazy
  # I nicked it from Jannis Harder at http://markmail.org/message/nqgrsmaixwbrvsno
  def self.float_to_rational(value)
    if value.nan?
      return Rational(0,0) # Div by zero error
    elsif value.infinite?
      return Rational(value<0 ? -1 : 1,0) # Div by zero error
    end

    s,e,f = [value].pack("G").unpack("B*").first.unpack("AA11A52")
    s = (-1)**s.to_i
    e = e.to_i(2)
    if e.nonzero? and e<2047
      Rational(s)* Rational(2)**(e-1023)*Rational("1#{f}".to_i(2),0x10000000000000)
    elsif e.zero?
      Rational(s)* Rational(2)**(-1024)*Rational("0#{f}".to_i(2),0x10000000000000)
    end
  end

end