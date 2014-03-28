class Airport < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 100}, uniqueness: true
	validates :city, presence: true, length: {maximum: 50}
	validates :state, presence: true, length: {maximum: 20}
end
