class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.float :ratings
      t.string :image
      t.references :cafe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
