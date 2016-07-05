class AddThemeToWhiteboards < ActiveRecord::Migration[5.0]
  def change
    add_column :whiteboards, :theme, :string
  end
end
