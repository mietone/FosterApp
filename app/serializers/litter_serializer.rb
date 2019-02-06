class LitterSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :with_mom, :mom_name
  has_many :kittens
  has_many :users
end
