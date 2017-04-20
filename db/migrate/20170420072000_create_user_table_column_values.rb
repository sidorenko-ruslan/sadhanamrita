class CreateUserTableColumnValues < ActiveRecord::Migration[5.0]
  def change
    create_table :user_table_column_values do |t|
      t.integer :user_id, null: false
      t.integer :table_column_id, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.json    :days_values, null: false, default: {}
    end
    add_foreign_key :user_table_column_values, :users
    add_foreign_key :user_table_column_values, :table_columns
  end
end
