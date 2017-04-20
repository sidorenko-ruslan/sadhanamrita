class UserTableColumnValue < ApplicationRecord
	belongs_to :user
	belongs_to :table_column
end
