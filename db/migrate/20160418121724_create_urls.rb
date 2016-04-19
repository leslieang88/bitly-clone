class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |u|
			u.string :long_url
			u.string :short_url
			u.datetime :created_at
			u.datetime :updated_at
	    end
	end
end
