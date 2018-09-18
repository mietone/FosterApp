class AddImageToKittens < ActiveRecord::Migration[5.2]
  def change
    add_column :kittens, :image, :string
  end
end
