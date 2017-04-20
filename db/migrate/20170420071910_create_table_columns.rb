class CreateTableColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :table_columns do |t|
      t.string :title, null: false
      t.integer :type, null: false
      t.integer :order, null: false, default: 1
      t.timestamps
    end
  end
end
