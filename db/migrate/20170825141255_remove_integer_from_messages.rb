class RemoveIntegerFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :integer, :string
  end
end
