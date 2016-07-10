class Whiteboard < ApplicationRecord
  belongs_to :coderoom

  def run!
    script_path = "tmp/script_from_#{user_id}_at_#{Time.now.to_i}.rb"
    output_path = "tmp/output_from_#{user_id}_at_#{Time.now.to_i}.txt"

    script = "begin; "
    script << "result = eval(%q(#{one_line_content})); "
    script << "print '> ' + result.to_s unless result.nil?; "
    script << "rescue Exception => e; puts e.to_s; "
    script << "end"

    File.write script_path, script
    `ruby #{script_path} > #{output_path}`
    script_output = File.read output_path
    script_output = script_output[0..-2] if script_output[-1] == "\n"
    std_out = script_output

    self.output << "\n" unless self.output.blank?
    self.output << Whiteboard.formatted_output(std_out)
    self.save

    File.delete script_path, output_path
  end

  private

  def one_line_content
    content.gsub(/(\n)+/, '; ')
  end

  def self.formatted_output output
    lines = output.split("\n")
    lines.each do |line|
      breaks = line.size / 80
      (0..breaks).each {|i| line.insert( ((i+1)*80), "\n") unless line.size < ((i+1)*80)}
    end
    lines.join "\n"
  end

  def safe?
    return false if content.include? %w(`)
    return false if content.include? %w()
  end


end
