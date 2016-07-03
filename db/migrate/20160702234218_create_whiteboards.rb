class CreateWhiteboards < ActiveRecord::Migration[5.0]
  def change
    create_table :whiteboards do |t|
      t.string :content
      t.integer :coderoom_id
      t.integer :user_id

      t.timestamps
    end
  end
end
