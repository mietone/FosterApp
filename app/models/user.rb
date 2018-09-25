class User < ApplicationRecord
  has_many :kittens, inverse_of: :user
  has_many :litters, through: :kittens
  has_many :identities, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

   def self.create_with_omniauth(info, using_twitter)
    user_info = { username: info.name, password: Devise.friendly_token[0,20] }
    using_twitter ? user_info.merge!(nickname: info.nickname) : user_info.merge!(email: info.email)
    create(user_info)
  end

  def self.find_from_identity(identity, auth)
    # Find the user associated with the auth provider
    # Twitter has an edge case where instead of returning an email, they return their nickname
    using_twitter = auth.provider == 'twitter'
    user = using_twitter ? where(nickname: auth.info.nickname).first : where(email: auth.info.email).first
    if user.present?
       # The user has already signed up with the same email or nickname the provider is returning
       # So create the user provider and link it to the user
       Identity.create_with_omniauth(auth, user)
       user
    else
       # First time the user is signing up to the site
       new_user = create_with_omniauth(auth.info, using_twitter)
       Identity.create_with_omniauth(auth, new_user)
       new_user
    end
  end

  # copy email/nickname if available from session whenever a user is initialized before signing up
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] || session["devise.google_oauth2_data"]
        user.email = data["email"] if user.email.blank?
      elsif data = session["devise.twitter_data"]
        user.nickname = data["nickname"] if user.nickname.blank?
      end
    end
  end

end
