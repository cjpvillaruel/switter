class Swit < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :sweets
	has_many :sours
end
