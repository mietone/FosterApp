class Kitten < ApplicationRecord
  belongs_to :user, inverse_of: :kittens, optional: true
  belongs_to :litter, inverse_of: :kittens, optional: true

  # validates_presence_of :litter

  mount_uploader :image, ImageUploader

  after_destroy :delete_empty_upload_directory

private

  def delete_empty_upload_directory
    FileUtils.rm_rf(Rails.root.join('public', 'uploads', 'kitten', 'image', self.id.to_s)) if self.image
  end

end
