class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # normalizes :email, with: ->(email) {email.strip.downcase} RAILS 7.1 ONLY
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
