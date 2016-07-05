class AddLanguageToWhiteboards < ActiveRecord::Migration[5.0]
  def change
    add_column :whiteboards, :language, :string
  end
end
