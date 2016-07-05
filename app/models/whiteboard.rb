class Whiteboard < ApplicationRecord
  belongs_to :coderoom

  def run
    base_path = "tmp/script_at_#{Time.now.to_i}"
    file_path = "#{base_path}.rb"
    output_path = "#{base_path}_output.txt"
    File.open(file_path, 'w') {|file| file.write(content)}
    %x(ruby #{Rails.root}/#{file_path} > #{output_path} 2>&1)
    result = File.read(output_path).gsub("#{Rails.root}/#{file_path}", 'Line ')
    File.delete file_path, output_path
    result
  end
end
