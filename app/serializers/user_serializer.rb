class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username

  has_many :kittens
  has_many :litters
  has_many :identities
end
