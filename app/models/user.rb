class User < ApplicationRecord
  has_many :kittens, inverse_of: :user
  has_many :litters, through: :kittens
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
