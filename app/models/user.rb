class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  has_many :links

  validates :email, uniqueness: true
  validates :name,
            :email,
            :password, presence: true
end
