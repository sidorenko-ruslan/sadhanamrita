class UserTableColumn < ApplicationRecord
	belongs_to :user
	belongs_to :table_column
end
