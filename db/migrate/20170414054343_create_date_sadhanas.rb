class CreateDateSadhanas < ActiveRecord::Migration[5.0]
  def change
    create_table :date_sadhanas do |t|
      t.integer :user_id, null: false
      t.date :date, null: false
      t.string :values
      t.timestamps
    end
  end
end
