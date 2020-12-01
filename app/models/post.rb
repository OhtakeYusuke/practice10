class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: {maximum: 140}
  belongs_to :user
end
