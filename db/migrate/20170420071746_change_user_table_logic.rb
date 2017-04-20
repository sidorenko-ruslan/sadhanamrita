class ChangeUserTableLogic < ActiveRecord::Migration[5.0]
  def change
  	drop_table(:date_sadhanas)
  end
end
