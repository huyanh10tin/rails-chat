class RemoveSenderIdFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :sender_id, :string
  end
end
