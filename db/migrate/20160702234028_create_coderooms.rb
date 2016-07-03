class CreateCoderooms < ActiveRecord::Migration[5.0]
  def change
    create_table :coderooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
