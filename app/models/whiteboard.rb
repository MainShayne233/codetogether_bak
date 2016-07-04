class Whiteboard < ApplicationRecord
  belongs_to :coderoom

  def run
    path = "tmp/script_at_#{Time.now.to_i}.rb"
    File.open(path, 'w') {|file| file.write(content)}
    `ruby #{Rails.root}/#{path}`
  end
end
