class ChangeUsersTable < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :users, :login, ""
  end
end
