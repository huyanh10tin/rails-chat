class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  def self.generate_defaults
    Random.rand(1..100).times do |f|
      num = Random.rand(2..50)
      Message.create! recipient_id: 1, sender_id: num, body: Faker::Lorem.paragraph(2, true, 4)
    end

  end
end
