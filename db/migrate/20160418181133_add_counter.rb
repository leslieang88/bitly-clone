class AddCounter < ActiveRecord::Migration
	def change
		# name of database to be added, name of columnm type e.g. string, text
		add_column :urls, :counter, :integer
	end
end
