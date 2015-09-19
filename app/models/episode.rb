class Episode < ActiveRecord::Base
	belongs_to :show
	has_many :clips

	def to_param
		"#{id}-#{name.parameterize}"
	end
end
