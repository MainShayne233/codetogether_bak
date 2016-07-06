class AddOutputToWhiteboards < ActiveRecord::Migration[5.0]
  def change
    add_column :whiteboards, :output, :text, default: ''
  end
end
