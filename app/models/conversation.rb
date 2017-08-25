class Conversation < ApplicationRecord
  has_many :messages
  has_many :user_conversations
  has_many :users, through: :user_conversations

  def other_users_name(current_user)
    users.where("user_id != ?", current_user.id).map {|u| u.name}
  end
end
