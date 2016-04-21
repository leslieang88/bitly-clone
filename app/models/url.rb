class Url < ActiveRecord::Base

	validates_presence_of :long_url, :short_url
    validates :long_url, format: {with: /(((ftp|http|https):\/\/)|(\/)|(..\/))(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/}
    
	def shorten
		# generate a new random short url for each URL entered by users
		choices_array = ('a'..'z').to_a + ('1'..'9').to_a
		result_array = choices_array.sample(6)
		self.short_url = result_array.join("")
	end

end
