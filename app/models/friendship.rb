class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def confirm
    self.status = "accepted"    
  end
end
