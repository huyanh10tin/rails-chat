class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :photos, as: :attachment, dependent: :destroy

  validates :body, presence: true

  has_ancestry

  has_many :likes, as: :item, dependent: :destroy

  def liked?(user)
    likes.include?(user_id: user)
  end
end
