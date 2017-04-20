class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_table_columns
  has_many :table_columns, through: :user_table_columns
  has_many :user_table_column_values

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :add_default_table_columns


  private

  def add_default_table_columns
  	tc = TableColumn.first(3)
  	UserTableColumn.create(user_id: self.id, table_column_id: tc.first.id, is_primary: true)
  	UserTableColumn.create(user_id: self.id, table_column_id: tc.second.id, is_primary: true)
  	UserTableColumn.create(user_id: self.id, table_column_id: tc.third.id, is_primary: true)
  end

end
