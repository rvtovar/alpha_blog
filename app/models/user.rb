class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy
  validates :username, presence: true,
           uniqueness: { case_sensitive: false },
           length: { minimum: 3, maximum: 25 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
           uniqueness: { case_sensitive: false },
           length: { maximum: 150 },
            format: { with: EMAIL_REGEX }

  has_secure_password
end
