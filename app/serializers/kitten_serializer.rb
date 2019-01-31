class KittenSerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :color, :litter_id, :user_id, :image, :dob

  belongs_to :user
  belongs_to :litter
end
