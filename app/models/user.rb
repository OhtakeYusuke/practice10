class User < ApplicationRecord
  validates :name,
            presence: true,
            length: {maximum: 20}
  validates :age,
            presence: true,
            numericality: true,
            inclusion: {in: 0..130}
  validates :email,
            presence: true,
            uniqueness: true,
            length: {maximum: 50}
  validates :profile,
            presence: true,
            length: {maximum: 140}
  validates :password, presence: true
  has_secure_password
  has_many :posts, dependent: :destroy
end
