class Cohort < ActiveRecord::Base
	has_many :users
	has_many :assignments
	belongs_to :location
end
