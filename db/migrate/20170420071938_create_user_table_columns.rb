class CreateUserTableColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :user_table_columns do |t|
      t.integer :user_id, null: false
      t.integer :table_column_id, null: false
      t.boolean :is_active, null: false, default: true
      t.boolean :is_primary, null: false, default: false
    end

    add_foreign_key :user_table_columns, :users
    add_foreign_key :user_table_columns, :table_columns
  end
end
