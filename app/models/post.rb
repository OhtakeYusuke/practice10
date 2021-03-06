class Post < ApplicationRecord
  validates :title, 
            presence: true,
            length: {maximum: 30}
  validates :description,
            presence: true,
            length: {maximum: 140}
  belongs_to :user
end
