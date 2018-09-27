class AddDobToKittens < ActiveRecord::Migration[5.2]
  def change
    add_column :kittens, :dob, :date
  end
end
