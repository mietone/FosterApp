class Litter < ApplicationRecord
  has_many :kittens, inverse_of: :litter, dependent: :destroy
  has_many :users, through: :kittens

  accepts_nested_attributes_for :kittens,
                                allow_destroy: true,
                                reject_if: proc {|att| att['name'].blank? }

end
