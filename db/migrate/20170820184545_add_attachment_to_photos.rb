class AddAttachmentToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :attachment_type, :string
    add_column :photos, :attachment_id, :integer
  end
end
