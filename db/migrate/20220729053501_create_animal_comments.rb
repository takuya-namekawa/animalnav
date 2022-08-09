class CreateAnimalComments < ActiveRecord::Migration[6.1]
  def change
    create_table :animal_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :animal_id

      t.timestamps
    end
  end
end
