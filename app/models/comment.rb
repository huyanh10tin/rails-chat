class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true
  
  has_many :likes, as: :item, dependent: :destroy
end
