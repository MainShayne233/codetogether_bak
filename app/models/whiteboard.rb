class Whiteboard < ApplicationRecord
  belongs_to :coderoom

  def run!
    script_path = "tmp/script_from_#{user_id}_at_#{Time.now.to_i}.rb"
    embedded_script_path = "tmp/embedded_script_from_#{user_id}_at_#{Time.now.to_i}.rb"
    output_path = "tmp/output_from_#{user_id}_at_#{Time.now.to_i}.txt"
    embedded_output_path = "tmp/embedded_output_from_#{user_id}_at_#{Time.now.to_i}.txt"
    File.write script_path, content
    begin
      `ruby #{script_path} > #{output_path}`
      std_out = File.read(output_path)
      File.write embedded_script_path, "print eval(%q(#{one_line_content}))"
      `ruby #{embedded_script_path} > #{embedded_output_path}`
      std_out << "> #{File.read(embedded_output_path)[std_out.size..-1]}"
      puts File.read(embedded_output_path)
    rescue Exception => e
      byebug
      std_out = e.to_s
    ensure
      # FileUtils.rm script_path
      # FileUtils.rm output_path
    end
    self.output << "\n" unless self.output.blank?
    self.output << Whiteboard.formatted_output(std_out)
    self.save
  end

  private

  def one_line_content
    content.gsub(/(\n)+/, '; ')
  end

  def self.formatted_output output
    output = output.to_s
    lines = output.size / 80
    (0..lines).each {|i| output.insert( ((i+1)*80), "\n") unless output.size < ((i+1)*80)}
    output
  end


end
