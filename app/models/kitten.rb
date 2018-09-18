class Kitten < ApplicationRecord
  belongs_to :user, inverse_of: :kittens, optional: true
  belongs_to :litter, inverse_of: :kittens, optional: true

  mount_uploader :image, ImageUploader
  
end
