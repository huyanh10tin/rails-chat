class Message < ApplicationRecord
  belongs_to :conversation
  # belongs_to :sender, class_name: "User"
  # belongs_to :recipient, class_name: "User"

  has_many :photos, as: :attachment, dependent: :destroy

  def self.generate_defaults
    Random.rand(1..100).times do |f|
      num = Random.rand(2..50)
      Message.create! recipient_id: 1, sender_id: num, body: Faker::Lorem.paragraph(2, true, 4)
    end

  end
end
