class AddStatusToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :status, :integer, default: 0, null: false
    add_index :articles, :status
  end
end
