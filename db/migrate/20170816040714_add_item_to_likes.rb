class AddItemToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :item_id, :integer
    add_column :likes, :item_type, :string
  end
end
