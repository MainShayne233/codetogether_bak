class Whiteboard < ApplicationRecord
  belongs_to :coderoom

  def run
    begin
      output = eval(content)
    rescue Exception => e
      output = e
    end
    Whiteboard.formatted_output output
  end

  def self.formatted_output output
    output = output.to_s
    lines = output.size / 80
    (0..lines).each {|i| output.insert( ((i+1)*80), "\n") unless output.size < ((i+1)*80)}
    output
  end


end
