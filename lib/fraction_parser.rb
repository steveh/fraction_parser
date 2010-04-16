class FractionParser

  def self.parse(string)
    string = string.strip
    if string =~ /^((\d+)\s+)?((\d+)\/(\d+))$/
      sum = Rational($4, $5)
      sum += $2.to_i if $2
      sum
    else
      sum = Rational(string.to_f, 1)
    end
  end

end