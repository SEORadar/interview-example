require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  attr_accessor :password

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true
  has_secure_password

  has_many :user_logins
  has_many :favorite_products
  has_many :favorites, through: :favorite_products, source: :product

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
