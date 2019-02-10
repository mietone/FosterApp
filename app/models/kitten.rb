class Kitten < ApplicationRecord
  belongs_to :user, inverse_of: :kittens, optional: true
  belongs_to :litter, inverse_of: :kittens, optional: true

  validates :name, presence: true
  validates :name, uniqueness: { scope: :litter_id }
  validate :dob_cannot_be_in_the_future

  mount_uploader :image, ImageUploader

  after_destroy :delete_empty_upload_directory

  # default_scope { order(created_at: :desc) }

  def self.next(kitten)
    kitten = where('id > ?', kitten.id).first

    if kitten
      kitten
    else
      Kitten.first
    end
  end

  def self.prev(kitten)
    kitten = where('id < ?', kitten.id).last

    if kitten
      kitten
    else
      Kitten.last
    end
  end

private

  def dob_cannot_be_in_the_future
    if dob.present? && dob.future?
      errors.add(:dob, "can't be in the future")
    end
  end

  def delete_empty_upload_directory
    FileUtils.rm_rf(Rails.root.join('public', 'uploads', 'kitten', 'image', self.id.to_s)) if self.image
  end

end
