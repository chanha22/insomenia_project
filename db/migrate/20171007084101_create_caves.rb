class CreateCaves < ActiveRecord::Migration[5.0]
  def change
    create_table :caves do |t|
      t.string :name
      t.text :desc
      t.string :address
      t.float :lat
      t.float :lng
      t.float :keywords
      t.string :images
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
