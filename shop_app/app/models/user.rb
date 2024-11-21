class User < ApplicationRecord
  has_many :items, dependent: :destroy

  # validates :user_name, presence: true
  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, presence: true, length: { minimum: 6 }
end
