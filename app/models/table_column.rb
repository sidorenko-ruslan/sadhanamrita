class TableColumn < ApplicationRecord
	has_many :user_table_columns
	has_many :users, through: :user_table_columns
end
