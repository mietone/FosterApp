class Kitten < ApplicationRecord
  belongs_to :user, inverse_of: :kittens, optional: true
  belongs_to :litter, inverse_of: :kittens, optional: true

  validates :name, uniqueness: { scope: :litter_id }
  validate :dob_cannot_be_in_the_future
  # validates_presence_of :litter

  mount_uploader :image, ImageUploader

  after_destroy :delete_empty_upload_directory

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
