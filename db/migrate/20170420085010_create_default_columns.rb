class CreateDefaultColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :table_columns, :type
  	add_column :table_columns, :column_type, :integer, null: false

    TableColumn.create( title: "Количество кругов", column_type: 1, order: 0 )
    TableColumn.create( title: "Время подъёма", column_type: 2, order: 1 )
    TableColumn.create( title: "Время отбоя", column_type: 2, order: 2 )
  end
end
