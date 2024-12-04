class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :items, dependent: :destroy

  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }

  def self.from_google(u)
    user_name = u[:email]
    create_with(uid: u[:uid], provider: 'google',
                password: Devise.friendly_token[0, 20],
                user_name: user_name).find_or_create_by!(email: u[:email])
  end

  
end
