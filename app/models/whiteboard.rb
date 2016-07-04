class Whiteboard < ApplicationRecord
  belongs_to :coderoom

  def run
    path = "tmp/script_at_#{Time.now.to_i}.rb"
    File.open(path, 'w') {|file| file.write("begin; #{content.gsub("\n", '; ')}; rescue Exception => e; puts e; end")}
    result = %x(ruby #{Rails.root}/#{path})
    File.delete(path)
    result
  end
end
