class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :recipient_id
      t.string :integer
      t.text :body

      t.timestamps
    end
  end
end
