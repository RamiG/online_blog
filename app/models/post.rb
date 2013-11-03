class Post < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user
  has_one :category
  has_many :comments, dependent: :destroy
  validates :title, presence: true  
  validates :content, presence: true
  validates :user, presence: true
end
