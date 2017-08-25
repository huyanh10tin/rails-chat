class RemoveRecipientIdFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :recipient_id, :string
  end
end
