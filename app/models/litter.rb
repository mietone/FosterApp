class Litter < ApplicationRecord
  has_many :kittens, inverse_of: :litter, dependent: :destroy
  has_many :users, through: :kittens

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :kittens,
                                allow_destroy: true

  scope :my_litters, ->(owner) { joins(:kittens).where(kittens: {user_id: owner.id})}

  scope :with_mom, -> { where(with_mom: true)}

end
