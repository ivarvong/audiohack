class Clip < ActiveRecord::Base
	belongs_to :episode
	belongs_to :user
	
	def to_param
		#{}"#{id}-#{name.parameterize}"
		["#{id}", "#{user.try(:name).parameterize}", "#{episode.try(:name).parameterize}"].join("-")
	rescue
		"#{id}"
	end
end
