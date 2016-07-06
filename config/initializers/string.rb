class String
  def profane?
    %w(21062416 08191807 23182416 260808 26080819121522 2518072419).each do |profanity|
      return true if self.downcase.include? profanity.decode
    end
    return true if !!(self[/8=*>/])
    false
  end

  def code
    self.split(//).map{|c| (-((c.ord - 96) - 27)).to_s.rjust(2, '0')}.join
  end


  def decode
    str = ''
    (0..self.size-1).step(2) do |i|
      str << (-(self[i..i+1].to_i - 27) + 96).chr
    end
    str
  end

end