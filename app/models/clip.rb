class Clip < ActiveRecord::Base
	def to_param
		#{}"#{id}-#{name.parameterize}"
		"#{id}"
	end
end
