class CreateKittens < ActiveRecord::Migration[5.2]
  def change
    create_table :kittens do |t|
      t.references :user, foreign_key: true
      t.references :litter, foreign_key: true
      t.string :name
      t.boolean :sex
      t.string :color
      t.integer :user_id

      t.timestamps
    end
  end
end
