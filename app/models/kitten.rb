class Kitten < ApplicationRecord
  belongs_to :user
  belongs_to :litter, optional: true
end
