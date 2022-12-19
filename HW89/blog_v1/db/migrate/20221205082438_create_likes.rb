class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      # t.string :likeable_type
      t.references :likeable, polymorphic: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, %i[author_id likeable_type likeable_id], unique: true
    add_index :likes, %i[likeable_id likeable_type]
  end
end
