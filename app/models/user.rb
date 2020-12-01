class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :profile, presence: true, length: {maximum: 140}
  validates :password, presence: true
  has_secure_password
  has_many :posts, dependent: :destroy
end
