class Comment < ActiveRecord::Base
  belongs_to :post 
  belongs_to :user

  validates :comment_text, presence: true, length: { maximum: 512 }
  validates :post_id, presence: true
end