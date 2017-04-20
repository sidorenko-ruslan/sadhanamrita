class TableColumnsController < ApplicationController
	before_action :authenticate_user!

	def index
		
		@table_columns = current_user.table_columns
	end

	def new
		@column_types = [ {name: "число", val: 1}, {name: "время", val: 2}, { name: "текст", val: 3 }  ]
		@table_column = TableColumn.new
	end

	def create
		@table_column = TableColumn.new table_column_params
		if @table_column.save
			UserTableColumn.create( user_id: current_user.id, table_column_id: @table_column.id )
			redirect_to table_columns_path
		else
			render "new"
		end
	end

	def edit
		@column_types = [ {name: "число", val: 1}, {name: "время", val: 2}, { name: "текст", val: 3 }  ]
		@table_column = TableColumn.find_by_id params[:id]
	end

	def update
		@table_column = TableColumn.find_by_id params[:id]
		if @table_column.update table_column_params
			redirect_to table_columns_path
		else
			render "edit"
		end
	end

	def destroy
		# if (!@table_column.is_primary)
		# 	@table_column.is_active
		# end
		redirect_to table_columns_path
	end

	private

	def table_column_params
		params.require(:table_column).permit(:title,:column_type,:order)
	end
end
