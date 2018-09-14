class CreateLitters < ActiveRecord::Migration[5.2]
  def change
    create_table :litters do |t|
      t.string :litter_name
      t.date :foster_start_date
      t.date :foster_end_date
      t.boolean :with_mom, default: false, null: false
      t.string :mom_name

      t.timestamps
    end
  end
end
